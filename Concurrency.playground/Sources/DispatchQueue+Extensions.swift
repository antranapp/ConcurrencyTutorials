import Foundation

extension DispatchQueue {
    static var currentLabel: String? {
        let name = __dispatch_queue_get_label(nil)
        return String(cString: name, encoding: .utf8)
    }
}
