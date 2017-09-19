//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, class"

let str2 = "Hiya, playground"
str2

var num = 1
type(of: num)
type(of: str)

var str3: String
str3 = "14" + "37" + "a"

var aNum = 14 + 37.5
type(of: aNum)

var i: Int = 13
i += 4
i = 7 + 6
i = 7 * 6
i = 7 / 6
i = 15 % 7

i = 1 % 3
i = 2 % 3
i = 3 % 3
i = 4 % 3
i = ((0 - 1) % 3) + 3

var anArray = [14, 37, 18, 64]
type(of: anArray)
anArray.append(82)

anArray = [14, 13] + [12, 11]
anArray[0] = 6
anArray
anArray[3]

var aDictionary = ["a": 13, "b": 14]
aDictionary["a"]
type(of: aDictionary)

func add2(someInt value: Int) -> Int {
    return value + 2
}
let five = 5
add2(someInt: five)

var t = (1, "a")
type(of: t)
t.0 = 4
t.1 = "456abc"
t

var t2 = (anInt: 1, aString: "b")
t2
t2.anInt = 14
t2
t2.0 = 13
t2
type(of: t2)

var f2 = { (value: Int) -> Int in
    return value + 2
}
var f3 = f2

type(of: f2)
add2(someInt: f2(5))

func perform(value: Int, op: (Int) -> Int) -> Int {
    return op(value)
}

perform(value: 5, op: add2)

func mult2(value: Int) -> Int {
    return value * 2
}

perform(value: 12, op: mult2(value:))

var val = perform(value: 12) { return $0 / 3 }
val
val = perform(value: 12, op : { return $0 / 2 })
val

struct Arguments {
    var anInt: Int
    var aString: String
}

let ourArray = [16, 47, 38, 22, 4]
var s = ourArray.sorted { $0 < $1 }
s
s = ourArray.filter { $0 < 20 }
s
s = ourArray.map { $0 / 2 }
s
s = ourArray.map { $0 / 3 }
s
let reduced = ourArray.reduce(0) { return $0 + $1 }
reduced






