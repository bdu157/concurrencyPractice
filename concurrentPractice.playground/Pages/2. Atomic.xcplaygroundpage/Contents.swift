//: [Previous](@previous)

import Foundation

//Thread safety
class Atomic<Value> {
    private var value: Value
    private let q = DispatchQueue(label: "Atomic<\(Value.self)")
    
    init(value: Value) {
        self.value = value
    }
    
    func modify(_ modifier: (Value)-> Value) {
        
        //using serial queue to make it safe -> this is like lock.lock() / unlock()
        q.sync {
            value = modifier(value)
        }
    }
    
    func get() -> Value {
        
        //using serial queue to make it safe
        return q.sync {
            value
        }
    }
}

let sharedValue = Atomic(value: 40)

DispatchQueue.concurrentPerform(iterations: 100, execute: { threadNumber in
    sharedValue.modify {$0 + 1}
})

print(sharedValue.get())


//if you run sync within async then it will run forever


//: [Next](@next)
