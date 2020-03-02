package ndfs.mcndfs_4_naive;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import graph.State;

// Implementation of 4_naive - Custom HashMap with Segment-level locking

public class RedMap<K, V> {

    // Array with hash index containing a list of nodes
    public Node<State,Boolean>[] array;

    // Locks for the corresponding hashcodes
    public Lock[] locks;

    // Node has to point to next.Node, stored in array
    public class Node<Km, Vm> {
        public State key;
        public Boolean value;
        public Node<State,Boolean> next;

        public Node(State key, Boolean value, Node<State,Boolean> next) {
            this.key = key;
            this.value = value;
            this.next = next;
        }
    }
    
    @SuppressWarnings("unchecked")
    public RedMap(int capacity) {
        this.array = new Node[capacity];
        this.locks = new Lock[capacity];

        for(int i = 0; i < capacity; i++) {
            this.array[i] = null;
            this.locks[i] = new ReentrantLock();
        }
    }
    
    /**
     * Synchronized() block on segment-level, where specific hashcode of an array is synchronized
     * @param key
     * @return true if the key is colored red
     *          else return null
     */
    public Boolean get(Object key) {
        Node<State,Boolean> node;
        Boolean value;

        // Obtain the hashcode for the corresponding key (add then modulo to obtain positive value)
        int index = (((key.hashCode() % array.length) + array.length) % array.length);

        // Return null if there is no key in the map
        if (array[index] == null){
            return null;
        }
        
        // Lock the segment and iterate the nodes at the specific hashcode
        synchronized(array[index]){
            node = array[index];
            if (node == null){
                return null;
            }
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
     * 
     * @param key
     * @param value
     */
    public void put(State key, Boolean value) {
        Node<State,Boolean> node, insert;

        // Obtain the hashcode for the corresponding key (add then modulo to obtain positive value)
        int index = (((key.hashCode() % array.length) + array.length) % array.length);

        // Add new node to the segment if there is none
        if (array[index] == null){
            insert = new Node<State,Boolean>(key, value, null);
            array[index] = insert;
            return;
        }

        // Lock the segment and iterate the nodes at the specific hashcode
        synchronized(array[index]){
            node = array[index];
            for (; node != null; node = node.next){
                if (key.equals(node.key)){
                    node.value = value;
                    return;
                }     
            }
            // Point to the first node and take over the segment of the array
            node = array[index];
            insert = new Node<State,Boolean>(key, value, node);
            array[index] = insert;
        }
        return;
    }
}