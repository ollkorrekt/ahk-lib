#Requires AutoHotkey v2.0
;a function to give the sum of the items in an enumerable (0 for an empty one).

#Include <foldl>

sum(enum) => foldl(enum, (a,b) => a + b, 0)