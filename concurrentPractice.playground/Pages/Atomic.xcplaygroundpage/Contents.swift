import Foundation

class Atomic<T> {

    private var privateValue: T
    private let q = DispatchQueue(label: "ThreadsafeValueQueue")

    init(_ value: T) {
        privateValue = value
    }

    var value : T {
        get  {
            return q.sync {privateValue

            }    //BG qeueue serial way (sync) so it happens one by one
        }
        set {
            q.async {
                self.privateValue = newValue  //useful with singleton not safe?? this is how you make singleton??
            }
        }
    }
    func withValue(_ closure:@escaping (T) -> Void) {
        q.async {
            closure(self.privateValue)
        }
    }
}

let atomicInteger = Atomic<Int>(42)
let atomicString = Atomic("Hello there")

atomicString.withValue { print($0) }






