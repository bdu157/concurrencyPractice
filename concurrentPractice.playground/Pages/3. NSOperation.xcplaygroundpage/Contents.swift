//: [Previous](@previous)

import Foundation
//import UIKit

//DispatchGroup and operations
let queue = OperationQueue()
queue.name = "MyOperationQueue"
//queue.name = "MySerialOperationQeueu"

queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
//queue.maxConcurrentOperationCount = 1  //this is making it serial queue

let op1 = BlockOperation {
    print("1. Do thit")
}

let op2 = BlockOperation {
    print("2. do this at the same time")
}

let op3 = BlockOperation {
    print("3. do this when both 1 and 2 are done")
}

let op4 = BlockOperation {
    print("4. do this at the same time")
}

op3.addDependency(op1)
op3.addDependency(op2)

//opt3 endups last because opt3 is dependent on opt1,2 so 1 and 2 have to be done first
queue.addOperations([op1, op2, op3, op4], waitUntilFinished: false)

//for serial queue
queue.addOperation {op1}
queue.addOperation {op2}
queue.addOperation {op3}
queue.addOperation {op4}

//: [Next](@next)
