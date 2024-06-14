#Requires AutoHotkey v2.0 
/* Sorts an array, or a portion of an array, using quicksort. The sorted portion
 * must not contain any unset elements. The sort is not stable, but is typically
 * faster than insertionSorted or array_insertionSort for extremely long lists.
 * However, this method requires O(log(n)) space on average, with a worst case
 * of O(n). Furthermore, according to my testing, quicksort only becomes faster
 * at lengths of around 1000 elements; oh well.
 * Optionally, specify indices start and end, outside of which the array will
 * not be sorted.
 * Also optionally, pass a function object compare to to use compare the items
 * instead of a default numeric comparison; compare  should return a positive
 * number if its first parameter is greater than its second, a negative number
 * if its second parameter is greater than its first, or zero if its parameters
 * are equal.
 */
#Include <array_swap>

Array.Prototype.quicksort := array_quicksort

array_quicksort(arr, start := 1, end := arr.Length, compare := (a, b) => a - b){
    if (end - start < 1){
        return ;the list must already be sorted
    } else if (end - start < 50){
        arr.insertionSort(start, end, compare)
        return ;on a small list, just use insertion
    }
    ;choose the pivot using the median of the first, last, and middle element.
    middle := (start + end) // 2
    ;make start >= middle
    if (compare(arr[start], arr[middle]) < 0) {
        arr.swap(start, middle)
    }
    ;make make start <= end
    if (compare(arr[start], arr[end]) > 0) {
        arr.swap(start, end)
        ;currently start <= end >= middle, so swap start w/middle if necc.
        if (compare(arr[start], arr[middle]) > 0){
            arr.swap(start, middle)
        }
    }
    pivot := arr[start]
    a := start + 1
    b := end
    while (a <= b) {
        ;loop over a and b alternating first, to try to be balanced when many eq val
        if (compare(pivot, arr[a]) >= 0){
            a++
            if (a <= b and compare(pivot, arr[b]) <= 0){
                b--
            ;loop over just a
            } else while (a <= b and compare(pivot, arr[a]) >= 0) {
                a++
            }
        ;loop over just b
        } else while (a <= b and compare(pivot, arr[b]) <= 0) {
            b--
        ;swap after we're done looping
        } else {
            arr.swap(a, b)
        }
    }
    arr.swap(start, b)
    arr.quicksort(start, b - 1)
    arr.quicksort(a, end)
}
