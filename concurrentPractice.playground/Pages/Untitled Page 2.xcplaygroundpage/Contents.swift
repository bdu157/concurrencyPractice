//: [Previous](@previous)

import Foundation

let group = DispatchGroup()

for i in 0..<10 {
    group.enter()   //making it a group
    
    DispatchQueue.global().async {
        
        usleep(useconds_t(i * 1_000_000))
        print("Doing work # \(i+1)")
        
        
        group.leave()
    }
}

group.notify(queue: .global()) {
    print("all my work is done!")
}

//when is it all done?

//: [Next](@next)
