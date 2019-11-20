import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: NSThread

//let thread = Thread {
//    print(">>>>> start downloading")
//    let imageURL = URL(string: "https://via.placeholder.com/150")!
//    let _ = try! Data(contentsOf: imageURL)
//    print("<<<<< finished downloading")
//}
//
//let threadName = thread.isMainThread ? "main thread" : "background thread"
//print("Start on \(threadName)")
//thread.start()
//print("Done 🎉 ")

//: Serial Queue

//var value: Int = 2
//
//DispatchQueue.main.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//for i in 4...6 {
//    value = i
//    print("\(value) ✡️")
//}
//
//DispatchQueue.main.async {
//    value = 9
//    print(value)
//}
//
//print("Done 🎉 ")

//: Concurrent Queue

//var value: Int = 20
//let serialQueue = DispatchQueue(label: "com.queue.serial")
//
//func doAsyncTaskInSerialQueue() {
//    for i in 1...3 {
//        serialQueue.async {
//            if Thread.isMainThread{
//                print("\(i) task running in main thread")
//            } else {
//                print("\(i) task running in other thread")
//            }
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//        }
//    }
//}
//
//doAsyncTaskInSerialQueue()
//
//serialQueue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//print("Done 🎉")

//: Serial Queue executing task synchronously

//var value: Int = 20
//let serialQueue = DispatchQueue(label: "com.queue.serial")
//
//func doSyncTaskInSerialQueue() {
//    for i in 1...3 {
//        serialQueue.sync {
//            if Thread.isMainThread{
//                print("\(i) task running in main thread")
//            } else {
//                print("\(i) task running in other thread")
//            }
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//        }
//    }
//}
//
//doSyncTaskInSerialQueue()
//
//serialQueue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//print("Done 🎉")

//: Concurrent Queue executing task asynchronously

//var value: Int = 20
//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//
//func doAsyncTaskInConcurrentQueue() {
//    for i in 1...3 {
//        concurrentQueue.async {
//            if Thread.isMainThread{
//                print("\(i) task running in main thread")
//            } else {
//                print("\(i) task running in other thread")
//            }
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//        }
//    }
//}
//
//doAsyncTaskInConcurrentQueue()
//
//concurrentQueue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//print("Done 🎉")

//: Concurrent Queue executing task synchronously

//var value: Int = 20
//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//
//func doSyncTaskInConcurrentQueueQueue() {
//    for i in 1...3 {
//        concurrentQueue.sync {
//            if Thread.isMainThread{
//                print("\(i) task running in main thread")
//            }else{
//                print("\(i) task running in other thread")
//            }
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//        }
//    }
//}
//
//doSyncTaskInConcurrentQueueQueue()
//
//concurrentQueue.async {
//    for i in 1...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//print("Done 🎉")

//: Target Queue

//var value: Int = 2
//
//let serialQueue = DispatchQueue(label: "serialQueue")
//let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: [.initiallyInactive, .concurrent])
//concurrentQueue.setTarget(queue: serialQueue)
//concurrentQueue.activate()
//
//concurrentQueue.async {
//    for j in 0...4 {
//        value = j
//        print("\(value) ✡️")
//    }
//}
//
//concurrentQueue.async {
//    for j in 5...7 {
//        value = j
//        print("\(value) ✴️")
//    }
//}
//
//print("Done 🎉")

//: DispatchGroup

//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//
//func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
//    concurrentQueue.async {
//        let group = DispatchGroup()
//        for i in 1...5 {
//            if Thread.isMainThread {
//                print("     \(i) task running in main thread")
//            } else{
//                print("     \(i) task running in other thread")
//            }
//            group.enter()
//            concurrentQueue.async {
//                let imageURL = URL(string: "https://via.placeholder.com/150")!
//                let _ = try! Data(contentsOf: imageURL)
//                print("     \(i) finished downloading")
//                group.leave()
//            }
//        }
//
//        /* Either write below code or group.notify() to execute completion block
//         group.wait()
//         DispatchQueue.main.async {
//         completion()
//         }
//         */
//        group.notify(queue: DispatchQueue.main) {
//            completion()
//        }
//    }
//}
//
//print(">>>>> Download all images asynchronously and notify on completion")
//
//performAsyncTaskIntoConcurrentQueue(with: {
//    print("<<<<< All images are downloaded")
//})
//
//print("Done 🎉")

//: DispatchWorkItem

//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//
//func performAsyncTaskInConcurrentQueue() {
//    var task: DispatchWorkItem?
//
//    task = DispatchWorkItem {
//        for i in 1...5 {
//            if Thread.isMainThread {
//                print("     \(i) task running in main thread")
//            } else{
//                print("     \(i) task running in other thread")
//            }
//
//            if (task?.isCancelled)! {
//                break
//            }
//
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("     \(i) finished downloading")
//        }
//        task = nil
//    }
//
//    /*
//     There are two ways to execute task on queue. Either by providing task to execute parameter or
//     within async block call perform() on task. perform() executes task on current queue.
//     */
//    // concurrentQueue.async(execute: task!)
//
//    concurrentQueue.async {
//        task?.wait(wallTimeout: .now() + .seconds(2))
//        // task?.wait(timeout: .now() + .seconds(2))
//        task?.perform()
//    }
//    concurrentQueue.asyncAfter(deadline: .now() + .seconds(2), execute: {
//        task?.cancel()
//    })
//
//    task?.notify(queue: concurrentQueue) {
//        print("<<<<< All images are downloaded")
//    }
//}
//
//print(">>>>> Download all images asynchronously and notify on completion")
//
//performAsyncTaskInConcurrentQueue()
//
//print("Done 🎉")

//: DispatchBarrier

//var value: Int = 2
//
//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//
//concurrentQueue.async(flags: .barrier) {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//concurrentQueue.async {
//    value = 4
//    print(value)
//}
//
//concurrentQueue.async(flags: .barrier) {
//    for j in 5...10 {
//        value = j
//        print("\(value) ✡️")
//    }
//}
//
//concurrentQueue.async {
//    for j in 11...15 {
//        value = j
//        print("\(value) ❤️")
//    }
//}
//
//concurrentQueue.async {
//    for j in 16...20 {
//        value = j
//        print("\(value) 😋")
//    }
//}
//
//concurrentQueue.async(flags: .barrier) {
//    for j in 21...25 {
//        value = j
//        print("\(value) 🤪")
//    }
//}
//
//print("Done 🎉")

//: DispatchSemaphore 1

//var value: Int = 2
//
//let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
//let semaphore = DispatchSemaphore(value: 1)
//
//for i in 0...4 {
//    concurrentQueue.async {
//        print("\(i) waiting")
//        semaphore.wait()
//        print("\(i) wait finished")
//        value = i
//        print("\(value) ✡️")
//        print("\(i) Done with assignment")
//        semaphore.signal()
//    }
//}
//
//print("Done 🎉")

//: DispatchSemaphore 2

//let concurrentQueue = DispatchQueue(label: "com.queue.concurrent", attributes: .concurrent)
//let semaphore = DispatchSemaphore(value: 2)
//
//func performAsyncTaskIntoConcurrentQueue() {
//    for i in 1...6 {
//        concurrentQueue.async {
//            print(">>>>> Image \(i) waiting for download")
//            semaphore.wait()
//            print("..... Downloading Image \(i)")
//            let imageURL = URL(string: "https://via.placeholder.com/150")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("<<<<< Image \(i) Downloaded")
//            semaphore.signal()
//        }
//    }
//}
//
//print("Download all images asynchronously")
//
//performAsyncTaskIntoConcurrentQueue()
//
//print("Done 🎉")
