#Requires AutoHotkey v2.0 
/* Like array_binarySearch, This method assumes the array is sorted, and finds
 * and returns the location in the array at which item would be inserted.
 * However, unlike that method, this one allows items in the array to be unset,
 * and will return the first unset index if there is one available in the
 * correct position. Arrays with many unset indicies may be searched slowly.
 * Returns the index i where arr[i] <= item < the first set item with an index
 * higher than i, or returns length + 1 if arr[length]  < item, or returns 1
 * otherwise (that is, if the array contains no set elements, if length = 0, or
 * if the first set element > item).
 * Optionally, specify a length, an index beyond which items will not be
 * checked. The default length is the length of the array, so that all items
 * will be checked.
 * Also optionally, pass a function object compare to use to compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal. If the input array is not sorted, the return value is not defined,
 * but it will be an integer between 1 and length + 1.
 */
Array.Prototype.binarySearchGap := array_binarySearchGap

array_binarySearchGap(
    arr,
    item,
    length := arr.Length,
    compare := (a,b) => a - b
){
    lowerBound := 1 ;i must be >= this
    upperBound := length + 1 ;i must be <= this
    while lowerBound < upperBound {
        ;look at the midpoint, favoring the left side when neccessary
        bound := (lowerBound + upperBound) // 2
        i := bound
        ;if there is a gap at bound, use the first filled index after the gap
        while !arr.Has(i){
            i += 1
            /* if there are no filled indicies after bound, then we can limit
             * the length to bound and try again.
             */
            if i > length {
                length := bound
                upperBound := length + 1
                continue(2)
            }
        }
        ;treat = the same as > so that will be stable when used for insertion.
        if compare(item, arr[i]) >= 0 {
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
