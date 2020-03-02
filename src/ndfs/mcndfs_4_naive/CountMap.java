package ndfs.mcndfs_4_naive;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


import graph.State;

// Implementation of 4_naive - Custom HashMap with Segment-level locking

public class CountMap<K, V> {

    // Locks for the corresponding hashcodes
    public Lock[] locks;

    // Array with hash index containing a list of nodes
    public Node<State,Integer>[] array;

    // Node has to point to next.Node, stored in array
    public class Node<Km, Vm> {
        public State key;
        public Integer value;
        public Node<State,Integer> next;

        public Node(State key, Integer value, Node<State,Integer> next) {
            this.key = key;
            this.value = value;
            this.next = next;
        }
    }
    
    @SuppressWarnings("unchecked")
    public CountMap(int capacity) {
        this.array = new Node[capacity];
        this.locks = new Lock[capacity];

        for(int i = 0; i < capacity; i++) {
            this.array[i] = null;
            this.locks[i] = new ReentrantLock();
        }
    }

    /**
     * @param key
     * @return value
     */
    public Integer get(State key){
        Node<State, Integer> node;
        Integer value;

        // Obtain the hashcode for the corresponding key (add then modulo to obtain positive value)
        int index = (((key.hashCode() % array.length) + array.length) % array.length);

        if (array[index] == null){
            return null;
        }

        // Lock the segment and iterate the nodes at the specific hashcode
        synchronized(array[index]){
            node = array[index];

            for (; node != null; node = node.next){
                
                if (key.equals(node.key)){
                    value = node.value;
                    return value;
                } 
            } 
        }
        
        return null;
    }

    /**
     * Increase the counter
     * @param key
     */
    public void increaseCount(State key){
        Node<State, Integer> node;
        int value = 0;

        // Obtain the hashcode for the corresponding key (add then modulo to obtain positive value)
        int index = (((key.hashCode() % array.length) + array.length) % array.length);

        // Add new node if there is none in the segment
        if (array[index] == null){
            value++;
            addNewSegment(key, value, index);
            return;
        }
        else {
            // Lock the segment and iterate the nodes at the specific hashcode
            synchronized(array[index]){
                node = array[index];
                
                for (; node != null; node = node.next){
                    if (key.equals(node.key)){               
                        node.value++;
                        return;
                    } 
                } 
                value++;
                addNewNode(key, value, index);
            }
        }
        
    }


    /**
     * Decrease the counter
     * @param key
     */
    public void decreaseCount(State key){
        Node<State, Integer> node;

        // Obtain the hashcode for the corresponding key (add then modulo to obtain positive value)
        int index = (((key.hashCode() % array.length) + array.length) % array.length);

        if (array[index] == null){
            return;
        }

        // Lock the segment and iterate the nodes at the specific hashcode
        synchronized(array[index]){
            node = array[index];

            if(node == null){
                System.out.println("X");
            }
                for (; node != null; node = node.next){
                    if (key.equals(node.key)){                
                        node.value--;
                        return;
                    }     
                } 
        }
        System.out.println("X");
    }

    /**
     * Adds the first node to the segment of that hash index
     * @param key
     * @param value
     * @param index
     */
    public void addNewSegment(State key, Integer value, int index){
        Node<State, Integer> newNode = new Node<State, Integer>(key, value, null);
        array[index] = newNode;
    }

    /**
     * Adds node to the beginning of the list and points to the previous first node
     * @param key
     * @param value
     * @param index
     */
    public void addNewNode(State key, Integer value, int index){
        Node<State,Integer> node, newNode;
        node = array[index];
        newNode = new Node<State, Integer>(key, value, node);
        array[index] = newNode;
        return;
    }
}