//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum OptionalDouble {
    case none
    case some(Double)
}

func squareRoot(value: Double) -> OptionalDouble {
    guard value >= 0.0 else { return OptionalDouble.none }
    return OptionalDouble.some(sqrt(value))
}

let value = squareRoot(value: 2.0)
var doubleValue: Double = -1.0

switch value {
    case .some(let val): doubleValue = val
    default: ()
}

if doubleValue > 0.0 {
    print(doubleValue)
}

enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}

var opt: Optional<Double>

func squareRoot(opt: Double) -> Optional<Double> {
    guard opt >= 0.0 else { return Optional<Double>.none }
    return Optional<Double>.some(sqrt(opt))
}

var opt2: Optional<Int>

var arr = [1 ,2, 3, 4]

let arr2 = arr.map { return Double($0 * 2) }
type(of: arr2)
let arr3 = arr.map { return $0 * 2 }
type(of: arr3)

var s: String? = "abcd"
//s = s + "e"

type(of: s)
var s1: String = "abcd"
//for c in s1.characters { print(c) }
if let s = s {
    type(of:s)
    for c in s.characters { print(c) }
}
type(of: s)

func ourCharacters(_ value: String?) {
    type(of: value)
    guard let value = value else { return }
    type(of: value)
    for c in value.characters { print(c) }
}

ourCharacters(s)

var s2: String! = "a"
type(of: s2)

s2 = s2 + "b"

s = s.map { $0 + "e" }
print(s)

var s3 = s.flatMap {
    return $0
}

type(of: s3)
print(s3)

var optArray: [String?] = ["a", nil, "c"]

protocol Printable {
    func doPrint()
}

extension Printable {
    func doPrint() {
        print(self)
    }
}

extension OptionalDouble : Printable { }
extension Int: Printable { }

squareRoot(value: 2.0).doPrint()

22.doPrint()



