#Requires AutoHotkey v2.0
/* like insertGap, but inserts with the behavior of insertAtGap, that is,
 * overwriting the first unset element after the inserted item rather than
 * shifting it over.
 */
#Include <extra\array_insertAtGap>
#Include <extra\array_binarySearchGap>

Array.Prototype.insertGapAtGap := array_insertGapAtGap

array_insertGapAtGap(arr, item, start?, end?, compare?)
    => arr.insertAtGap(arr.binarySearchGap(item, start?, end?, compare?), item)
