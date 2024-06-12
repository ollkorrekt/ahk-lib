#Requires AutoHotkey v2.0
/* Uses array_binarySearch to insert item into its place in a sorted array, at
 * the first index i where arr[i] <= item < arr[i+1], at end + 1 if arr[end] <
 * item, or at start otherwise (that is, if the array is empty, if end = 0, or
 * if arr[start] > item). This function does not support arrays with unset
 * elements; see insertGap for those. Because this method will insert an item
 * after all equal values, it can be used for stable insertion sorting.
 * Optionally, specify start, an index before which, and/or end, an index beyond
 * which, items will not be checked. The default start is 1 and the default end
 * is the length of the array, so that all items will be checked (the item may
 * be inserted up to one position beyond end).
 * Also optionally, pass a function object compare to to use compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal. If the input array (between the indices start and end) is not
 * sorted, the return value is not defined, but it will be an integer between
 * start and length + 1.
 */

#include <array_binarySearch>

Array.Prototype.insert := array_insert

array_insert(arr, item, start?, end?, compare?)
    => arr.InsertAt(arr.binarySearch(item, start?, end?, compare?), item)