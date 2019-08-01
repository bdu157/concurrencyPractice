//: [Previous](@previous)

import Foundation

let q = OperationQueue()

q.addOperation {
    print("operation 1")
}

let block1 = BlockOperation {
    print("block 1")
}

let block2 = BlockOperation {
    print("block 2")
}

block2.addDependency(block1)

let block3 = BlockOperation {
    print("block 3")
}

block3.addDependency(block2)

q.addOperation(block3)
q.addOperation(block2)
q.addOperation(block1)
//these will be run depending on dependency



//: [Next](@next)
