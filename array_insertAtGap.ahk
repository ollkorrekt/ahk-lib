#Requires AutoHotkey v2.0 
/* put the item in list at i, shifting subsequent items over until they hit an
 * unset item, then overwriting it. when there are few gaps, this method is much
 * slower than the native Array_InsertAt, which simply also shifts over unset
 * indices, but it can be helpful if you want this behavior.
 */
Array.Prototype.insertAtGap := array_insertAtGap

array_insertAtGap(arr, i, item, length?, compare?){ 
    while (i <= arr.Length and arr.Has(i)){
        temp := arr[i]
        arr[i] := item
        item := temp
        i++
    }
    if arr.Length = i - 1 {
        arr.push(item) ;extending the array
    } else {
        arr[i] := item ;overwriting a gap
    }
}