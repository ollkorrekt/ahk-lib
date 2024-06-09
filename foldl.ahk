#Requires AutoHotkey v2.0

foldl(collection, f, z?){
    for item in collection {
        if !(IsSet(z)){
            z := item
        } else {
            z := f(z, item)
        }
    }
    if !(IsSet(z)){
        throw ValueError("A default accumulator value must be provided to fold an empty collection.", -1)
    }
    return z
}