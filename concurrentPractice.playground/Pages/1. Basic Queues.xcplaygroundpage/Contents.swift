//: [Previous](@previous)

import Foundation

//: # example 1

//: There are 2 kinds of queues.

//; 1. Serial queue -> Executes a single piece of work at a time
//: 2. concurrent queue -> Executes multiple pieces of work at a time

/*
let queue = DispatchQueue(label: "Background-1")   // global() -> concurrent queue / background queue/ -> we can also add attribute: .concurrent

print("I'm here on the main queue!")

queue.async (execute: {  //async to run this in backgroundThread
    usleep(1)  //2s
    print("1. look at me doing hard work in the background")
})

queue.async(execute: {
    usleep(1)
    print("2. look at me doing hard in the background")
})

print("i've asked for work to happend in the bg")
print("\n")
*/
 
//: # example 2
//: provie an example of a serial queue with both async and sync blocks

let serialQueue = DispatchQueue(label: "MySerialQueue") //by default -> serial queue

print("start serial queue")

serialQueue.async {
    print("1")
}

serialQueue.async {
    print("2")
}

serialQueue.sync {
    print("3")
}

print("finished sync")

print("4")


//: # example 3

let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)

concurrentQueue.async {
    print("do this")
}

concurrentQueue.async {
    print("do this at the same time")
}

concurrentQueue.sync {
    print("is this working?")
}

//: [Next](@next)
