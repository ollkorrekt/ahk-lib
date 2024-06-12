#Requires AutoHotkey v2.0 
/* Sorts an enumerable object, such as an array, using binary insertion sort,
 * and returns the resulting sequence as a new array. The enumerable must not
 * contain any unset elements. The sort is stable. For arrays, this function is
 * slightly faster than array_insertionSort, but it does require O(n) space. It
 * may also be used for any enumerable type, rather than just arrays.
 * Optionally, pass a function object compare to use to compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal.
 */
#Include <array_insert>

insertionSorted(enumerable, compare?){
    outArr := []
    for item in enumerable {
        outArr.insert(item, , , compare?)
    }
    return outArr
}
