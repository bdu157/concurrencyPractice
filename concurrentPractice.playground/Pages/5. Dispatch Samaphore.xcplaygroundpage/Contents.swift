//: [Previous](@previous)

import Foundation
import UIKit
//: # Exmaple 8 -- not really being used i guess it depends on project or company

func download(url: URL) -> Data? {
    var data: Data?
    let semaphore = DispatchSemaphore(value:0)
    URLSession.shared.dataTask(with: url) { (d, _, _) in
        data = d
       semaphore.signal()
    }.resume()
    semaphore.wait()
    return data
}

//it gives signal to control so it runs in order

print("About to wait for luke to download")
let u = URL(string: "https://swapi.co/api/people/1/")!
if let d = download(url: u) {
    print("Download: \(d)")
}
print("Luke has finished downloading")






//: [Next](@next)
