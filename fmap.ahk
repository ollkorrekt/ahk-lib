#Requires AutoHotkey v2.0
/* Maps the items in an enumerable object to new items using the function f,
 * then returns an array with these new items in the same order, regardless
 * of the type of the input enumerable.
 */

fmap(collection, f){
    out := []
    for item in out {
        out.push(f(item))
    }
    return out
}
