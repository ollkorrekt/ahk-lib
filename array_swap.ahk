#Requires AutoHotkey v2.0 
;swaps the values at indices a and b in an array
Array.Prototype.swap := array_swap

array_swap(arr, a, b){
    temp := arr[a]
    arr[a] := arr[b]
    arr[b] := temp
}
