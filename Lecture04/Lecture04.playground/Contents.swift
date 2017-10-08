//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


typealias IntFunction = () -> (Int) -> (Int) -> (Int) -> Void
typealias Position = (Int, Int)


var intFunction: IntFunction

var pos: Position = (5,5)

var i = 2 == 3 ? 1 : 0

if 2 == 3 {
    i = 1
} else {
    i = 0
}
i

var a = [1,2,3]
var b = [4,5,6]
var c = [7,8,9]
var aa = [a,b,c]
type(of: aa)
var val = aa[2][1]
let val2 = aa[2]
aa[2][1] = 47
aa

var d = ["a" : [4, 3, 2] , "b": [6, 5]]
var dVal = d["q"]
type(of: dVal)


type(of:d)

while (1 == 0) {
    
}

repeat {
    
} while (1 == 0)

for i in 1 ... 5 {
    print (i)
}

for i in aa {
    print(i)
}

for i in d {
    print (i)
}

let r = 1 ..< 6

aa.forEach { i in
    print (i)
}

aa[0]
let bb = aa[0].map { $0 * 2 }
bb

var cc:[Int] = []
for i in aa[0] {
    cc.append(i * 2)
}
cc
let dd = aa[0].sorted { $0 < $1 }
dd
let ee = aa[0].sorted { $1 < $0 }
ee
var ff = aa[0].reduce(0) { $0 + $1 }
ff
ff = aa[0].reduce(0) { $0 + $1 }
ff

let z = zip(a,b)
for i in z {
    print (i)
}

type(of: aa)
aa
let gg = aa.flatMap {
    $0.map { $0 * 2}
}
gg
type(of: gg)

var boo: Bool = true

let booVal = boo ? 1 : 0

enum CellState : Int {
    case alive = 1
    case dead = 2
    case zombie = 4
    case newborn = 8
    
    func double() -> Int {
        return self.rawValue * 2
    }
}

var cs: CellState = .newborn
cs.double().byteSwapped


switch cs {
case .alive, .newborn: print ("I'm alive")
case .dead: print ("zzzzz")
default: print("what the? ")
}

print ("the raw value = \(cs.double())")


struct Person {
    var firstName: String
    var lastName: String
    var age: Int = 39
    var tripleAge: Int {
        return age * 3
    }
    
    init(firstName: String, lastName: String, age: Int = 39) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func doubleAge() -> Int {
        return self.age * 2
    }
}

let van = Person(firstName: "Van", lastName: "Simmons")
print("Van's age= \(van.doubleAge()), triple = \(van.tripleAge)")
van.lastName
van.firstName
van.age
van.tripleAge

class BasePerson {
    var age: Int = 39
}

class ClassPerson: BasePerson {
    var firstName: String
    var lastName: String
    var tripleAge: Int {
        return age * 3
    }
    
    init(firstName: String, lastName: String, age: Int = 39) {
        self.firstName = firstName
        self.lastName = lastName
        super.init()
        self.age = age
    }
    
    func doubleAge() -> Int {
        return self.age * 2
    }
}

let juan = ClassPerson(firstName: "Juan", lastName: "Collas")

var v = van
v
v.age = 50
van

var j = juan
j
j.age = 50
juan












