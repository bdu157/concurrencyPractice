//: [Previous](@previous)

import Foundation

let urls = [
    URL(string: "https://swapi.co/api/people/1/")!,
    URL(string: "https://swapi.co/api/people/2/")!,
    URL(string: "https://swapi.co/api/people/3/")!,
    URL(string: "https://swapi.co/api/people/4/")!
]

var peopleGroup = DispatchGroup()
var networkingGroup = DispatchGroup()

extension DispatchGroup {
    func enter (times: Int) {
        for _ in 0 ..< times { enter()}
    }
}

for personURL in urls {
    peopleGroup.enter(times: 1)
    networkingGroup.enter(times: 3)  // i am going to work on those tasks
    
    let task = URLSession.shared.dataTask(with: personURL) { (data, _, _ ) in
        print("got data for \(personURL): \(String(describing: data))")
        
        networkingGroup.leave()
        networkingGroup.leave()
        networkingGroup.leave() //hey i am all done with given tasks
        peopleGroup.leave()
    }
    task.resume()
}

peopleGroup.notify(queue: .main) {
    print("all 3 are done!")
}

networkingGroup.notify(queue: .main) {
    print("networking has completed")
}

//: [Next](@next)
