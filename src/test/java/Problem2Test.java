import org.junit.Test;

import static org.junit.Assert.*;

public class Problem2Test {

    // Example test
    // Okay to change
    @Test
    public void testBubbleSort() {
        int inputs[][] = {
                {3},
                {3,2},
                {2,3},
                {6,5,1},
                {-1,8,0},
                {0,-2,9,3}
        };
        int expects[][] = {
                {3},
                {2,3},
                {2,3},
                {1,5,6},
                {-1,0,8},
                {-2,0,3,9}
        };

        for (int i=0; i<inputs.length; i++) {
            Problem2.bubbleSort(inputs[i]);

            for (int j=0; j<inputs[i].length; j++) {
                assertArrayEquals(expects[i], inputs[i]);
            }
        }
    }
}
