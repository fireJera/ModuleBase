import Foundation

open class ModuleBaseTest: NSObject {
    public var testCount = 0
    public func printTest() {
        print("method \(#function) wac called, count is : \(testCount)")
    }
}
