#Requires AutoHotkey v2.0
/* This method assumes the array is sorted, and finds and returns the first
 * index i where arr[i] <= item < arr[i+1], or returns end  + 1 if arr[end]
 * < item, or returns start otherwise (that is, if the array is empty, if end =
 * 0, or if arr[1] > item). This function does not support arrays with unset
 * elements; see binarySearchGap for those. If the input array (between indices
 * start and end) is not sorted, the return value is not defined, but it will be
 * an integer between start and end + 1.
 * Optionally, specify start, an index before which, and/or end, an index beyond
 * which, items will not be checked. In this case, only the checked section of
 * the list must be sorted. The default start is 1 and the default end is the
 * length of the array, so that all items will be checked.
 * Also optionally, pass a function object compare to to use compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal.
 */

Array.Prototype.binarySearch := array_binarySearch

array_binarySearch(
    arr,
    item,
    start := 1,
    end := arr.Length,
    compare := (a, b) => a - b
){
    lowerBound := start ;i must be >= this
    upperBound := end + 1 ;i must be <= this
    while lowerBound < upperBound {
        ;look at the midpoint, favoring the left side when neccessary
        bound := (lowerBound + upperBound) // 2
        ;treat = the same as > so this will be stable when used for insertion.
        if compare(item, arr[bound]) >= 0 {
            ;item can't be at bound, it has to be to the right of it.
            lowerBound := bound + 1
        } else {
            /* item could be inserted where bound is now, which would put it to
             * the left of bound's new position.
             */
            upperBound := bound
        }
    }
    return lowerBound
}