#Requires AutoHotkey v2.0
/* This method assumes the array is sorted, and finds and returns the first
 * index i where arr[i] <= item < arr[i+1], or returns length + 1 or
 * arr.Length + 1 if arr[length] or arr[-1]  < item, or returns 1 otherwise
 * (that is, if the array is empty, if length = 0, or if arr[1] > item).
 * Optionally, specify a length, an index beyond which items will not be
 * checked. Also optionally, pass a function object compare to compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal. If the input array is not sorted, the return value is not defined,
 * but it will be an integer between 1 and length + 1 or arr.Length + 1.
 */

Array.Prototype.binarySearch := array_binarySearch

array_binarySearch(arr, item, length := arr.Length, compare := (a, b) => a - b) { ;assuming arr is already sorted
    lowerBound := 1 ;i must be >= this
    upperBound := length + 1 ;i must be <= this
    while lowerBound < upperBound {
        bound := (lowerBound + upperBound) // 2
        if compare(item, arr[bound]) >= 0 { ;= same as > so that will be stable w/foldl.
            lowerBound := bound + 1 ;item can't be at bound, it has to be to the right of it.
        } else {
            upperBound := bound ;item could be inserted where bound is now, which would put it to the left.
        }
    }
    return lowerBound
}