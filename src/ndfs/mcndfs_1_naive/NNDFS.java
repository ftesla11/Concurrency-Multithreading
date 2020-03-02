package ndfs.mcndfs_1_naive;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import ndfs.NDFS;
import graph.State;

/**
 * Implements the {@link ndfs.NDFS} interface, mostly delegating the work to a
 * worker class.
 */
public class NNDFS implements NDFS {

    private Worker[] Threads;

    public static HashMap<State, Boolean> Red = new HashMap<>();
    public static HashMap<State, Integer> Count = new HashMap<>();

    /**
     * Constructs an NDFS object using the specified Promela file.
     *
     * @param promelaFile
     *            the Promela file.
     * @throws FileNotFoundException
     *             is thrown in case the file could not be read.
     */ 

    public NNDFS(File promelaFile, int n) throws FileNotFoundException {
        Threads = new Worker[n];
        for (int i = 0; i < n; i++){
            Threads[i] = new Worker(promelaFile);
        }
    }
    

    @SuppressWarnings("unchecked")
    public boolean ndfs(){
        boolean hasCycle = false;

        ExecutorService executorService = Executors.newFixedThreadPool(Threads.length);
        CompletionService<Integer> completionService = new ExecutorCompletionService<Integer>(executorService);

        for(int i = 0; i < Threads.length; i++){
            completionService.submit(Threads[i]);
        }

        try {
            Future<Integer> future = completionService.take();
            if (future.get() > 0){
                hasCycle = true;
            }
        } catch(InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
        executorService.shutdownNow();
        return hasCycle;
    }
}
