//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var arr1 = [1,2,3,4]
var arr2 = [5,6,7,8]

var zipped = zip(arr1, arr2)

type(of: zipped)
print(type(of: zipped))

let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}

typealias Position = (row: Int, col: Int)

func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { zip( [Int](repeating: $0, count: cols) , 0 ..< cols ) }
        .flatMap { $0 }
        .map { Position(row: $0.0,col: $0.1) }
}

let pos = positions(rows: 5, cols: 3)
print(type(of: pos))


enum CellState {
    case a
    case b
}

var cells: [CellState] = []

func initialize(_ rows: Int, _ cols: Int, cellInitializer: (Int, Int) -> CellState = { _,_ in .a } ) {
    cells = [CellState](repeatElement(.b, count: rows))
    for i in 0 ..< cells.count {
        cells[i] = cellInitializer(i, cols)
    }
}

print(cells)
initialize(6, 6)
print(cells)

initialize(6,6) { (rows: Int, cols: Int) in
    return rows % 2 == 0 ? .a : .b
}
print(cells)


var arrCells = [[CellState]](repeatElement(cells, count: 6))
print(arrCells)

print (arrCells[4][3])

positions(rows: 6, cols: 6).forEach {
    print(type(of: $0))
    print("row: \($0.row), col: \($0.col)")
    print(arrCells[$0.row][$0.col])
}
