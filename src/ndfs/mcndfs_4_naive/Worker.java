package ndfs.mcndfs_4_naive;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.Collections;

import graph.Graph;
import graph.GraphFactory;
import graph.State;

// Implementation of algorithm 2 from Laarman using Custom HashMap with locks on segment level

public class Worker implements Callable{

    private final Graph graph;
    private final Colors colors = new Colors();

    public HashMap<State, Boolean> Pink = new HashMap<>();
    

    // Throwing an exception is a convenient way to cut off the search in case a
    // cycle is found.
    private static class CycleFoundException extends Exception {
        private static final long serialVersionUID = 1L;
    }

    /**
     * Constructs a Worker object using the specified Promela file.
     *
     * @param promelaFile the Promela file.
     * @throws FileNotFoundException is thrown in case the file could not be read.
     */
    public Worker(File promelaFile) throws FileNotFoundException {
        this.graph = GraphFactory.createGraph(promelaFile);
    }

    /**
     * Gets successors in a list
     * Shuffle to randomize the search
     * 
     * @param s node in the graph 
     * @return successors of node s
     */
    public List<State> getSuccessors(State s) {
        List<State> successors = graph.post(s);
        Collections.shuffle(successors);
        return successors;
    }

    /**
     * @param s
     * @return true if node is colored red
     *         false if node has not been added to Red hashmap (not red)
     */
    private boolean isRed(State s) {
        return NNDFS.Red.get(s) != null;
    }

    /**
     * Add state s to the Red hashmap and set its red color as true
     * @param s
     */
    private void setRed(State s) {
        NNDFS.Red.put(s, true);
    }

    private void incrementCount(State s) {
        NNDFS.Count.increaseCount(s);
    }

    private void decrementCount(State s) {
        NNDFS.Count.decreaseCount(s);
    }

    /**
     * Call dfsRed() recursively for all successors that are not red yet
     *  
     * @param s
     * @throws CycleFoundException
     * @throws InterruptedException
     */
     private void dfsRed(State s) throws CycleFoundException {

        Pink.put(s, true);
        List<State> successors = getSuccessors(s);

        for (State t : successors) {
            if (colors.hasColor(t, Color.CYAN)) {
                throw new CycleFoundException();
            }
            if (!Pink.containsKey(t) || !Pink.get(t) && !isRed(t)) {
                dfsRed(t);
            }
        }
        if (s.isAccepting()) {
            decrementCount(s);
            notifyOthers(s);
        }
        setRed(s);
        Pink.put(s, false);
    }

    /**
     * Notifies other threads if they are waiting on the counter
     * 
     * @param s
     * @throws InterruptedException
     */
    private void notifyOthers(State s) {
        synchronized (NNDFS.Count) {
            while (true) {
                int temp;
                if (NNDFS.Count.get(s) == null) {
                    temp = 0;
                    break;
                } else {
                    temp = NNDFS.Count.get(s).intValue();
                    if (temp > 0) {
                        try {
                            NNDFS.Count.wait();
                        } catch (InterruptedException e) {
                        }
                    } else{
                        break;
                    }
                    
                }
            }
            NNDFS.Count.notifyAll();
        }
    }
    
    
    /**
     * Calls dfsBlue() recursively if the successors are not yet colored red
     * 
     * @param s
     * @throws CycleFoundException
     * @throws InterruptedException
     */
    private void dfsBlue(State s) throws CycleFoundException {

        colors.color(s, Color.CYAN);

        List<State> successors = getSuccessors(s);
        for (State t : successors) {
            if (colors.hasColor(t, Color.WHITE) && !isRed(t)) {
                dfsBlue(t);
            }
        }
        if (s.isAccepting()) {
            incrementCount(s);
            dfsRed(s);
        }
        colors.color(s, Color.BLUE);
    }

    private void nndfs(State s) throws CycleFoundException {
        dfsBlue(s);
    }
    
    /**
     * @return 1 if cycle is found
     *         0 if no cycle found
     */
    public Integer call() {
        try {
            nndfs(graph.getInitialState());
        } catch (CycleFoundException e) {
            return 1;
        }
        return 0;   
    }

}