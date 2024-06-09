#Requires AutoHotkey v2.0
/* A function to reduce an enumerable object, such as an array,
 * element by element, left to right, with a function that takes an accumulator
 * z and an element and returns a new accumulator. If no initial value is given
 * for z, the first element of the enumerable is used.
 */

foldl(enumerable, f, z?){
    realF := f ;avoiding a loop-internal branch with a stateful assignment
    if !(IsSet(z)){
        f := (acc?, x?) => x
    }
    for item in enumerable {
        z := f(z?, item) ;for unset z, this just returns item
        f := realF ;for all subsequent loops, this is the real value for f
    }
    if !(IsSet(z)){
        throw ValueError("An initial accumulator value must be provided to fold an empty enumerable.", -1)
    }
    return z
}
