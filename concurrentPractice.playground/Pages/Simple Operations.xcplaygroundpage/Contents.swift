//: [Previous](@previous)

import Foundation

class ComputeOperation: Operation {
    private let max: Int
    
    init(maxNumber: Int) {
        self.max = maxNumber
        super.init()
    }
    override func main() {
        //when main() finishes,
        //the operation is over
        print("Starting \(max)")
        
        usleep(UInt32(max * 1_000_000))
        
        print("Finishing \(max)")
    }
}

let compute1 = ComputeOperation(maxNumber: 2)
let compute2 = ComputeOperation(maxNumber: 4)

//by adding this below since compute2 is dependent on compute1, compute1 has to execute and compute2
compute2.addDependency(compute1)
//compute1.addDependency(compute2) //this would not work. as a result => deadLock of circular dependency

let q = OperationQueue()
q.addOperation(compute1)
q.addOperation(compute2)

//: [Next](@next)
