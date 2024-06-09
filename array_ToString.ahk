#Requires AutoHotkey v2.0
/* A function to convert an array to a human-readable string, using the same
 * syntax that is used to create a literal array with square brackets and
 * commas. Any unset elements are represented as gaps in the list of elements,
 * except if the final element is unset, in which case it is represented with
 * the unset keyword. Set elements are converted to strings using String().
 */

Array.Prototype.ToString := array_ToString

array_ToString(arr){
    realDelim := ", "
    delim := "" ;do not put a deliminator before the first element
    outStr := "["
    for item in arr {
        outStr .= delim
        if IsSet(item){
            ;if not set, just put the deliminator with a blank in the list.
            outStr .= String(item)
        }
        delim := realDelim ;include a comma before all remaining elements
    }
    /* here we put "unset" at the end, as the normal array syntax ignores any
     * unset elements at the end unless specifically stated. This also allows
     * [unset] to be differentiated from [].
     */
    if !arr.Has(-1) and arr.Length != 0 {
        outStr .= "unset"
    }
    outStr .= "]"
    return outStr
}