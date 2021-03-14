public class Problem1 {

    // Do not change signature (function name, parameters)
    public static int binarySearch(int[] data, int target) {
        // Add your solution
        int start = 0;
        int end = data.length-1;
        while (start<=end) {
            int mid = (start + end)/2;
            if (data[mid]==target) {
                return mid;
            }
            if (target>data[mid]) {
                start = mid+1;
            } else {
                end = mid-1;
            }
        }
        return -1; // Place holder
    }
}
