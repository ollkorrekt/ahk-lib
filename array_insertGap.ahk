#Requires AutoHotkey v2.0
/* like array_insert, but supports insertion into arrays that contain unset
 * values. The array should still be sorted apart from any unset indices.
 */
#Include <array_binarySearchGap>

Array.Prototype.insertGap := array_insertGap

array_insertGap(arr, item, start?, end?, compare?)
    => arr.InsertAt(arr.binarySearchGap(item, start?, end?, compare?), item)
