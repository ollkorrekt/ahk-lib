#Requires AutoHotkey v2.0
/* Sorts an array, or a portion of an array, using binary insertion sort. The
 * sorted portion must not contain any unset elements. The sort is stable. This
 * method is slightly slower than insertionSorted, but requires only O(1) space.
 * Optionally, specify indices start and end, outside of which the array will
 * not be sorted.
 * Also optionally, pass a function object compare to to use compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal.
 */
#Include <array_insert>

Array.Prototype.insertionSort := array_insertionSort

array_insertionSort(arr, start := 1, end := arr.Length, compare?){
    if (start > end){
        throw ValueError("start must be <= end.")
    }
    loop (end - start + 1){
        i := start + A_Index
        arr.RemoveAt(i)
        arr.insert(arr[i], start, i-1, compare?)
    }
}
