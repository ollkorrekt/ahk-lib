#Requires AutoHotkey v2.0

foldl(collection, f, z?){
    realF := f ;avoiding a branch with a stateful assignment
    if !(IsSet(z)){
        f := (acc?, x?) => x
    }
    for item in collection {
        z := f(z?, item) ;for unset z, this just returns item
        f := realF
    }
    if !(IsSet(z)){
        throw ValueError("A default accumulator value must be provided to fold an empty collection.", -1)
    }
    return z
}
