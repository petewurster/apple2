//version 1
var nums = [Int]()
func main() {
   print("enter an\(nums.isEmpty ? "" : "other") integer")
   guard let input = readLine(),
       let newDouble = Double(input) else { return }
   nums.append(Int(newDouble))
   let mean = getMean(nums.reduce(0, {sum, next in sum + next}), nums.count)
   print("The mean of \(nums) is \(mean)", terminator: ": ")
   main()
}


// version 2
// var nums = [Any]()
// func main() {
//     var ints = [Int]()
//     print("enter an\(nums.isEmpty ? "" : "other") integer")
//     if let input = readLine() {
//         if input != "" {
//             nums.append(input)
//             for item in nums {
//                 if let newString = item as? String,
//                     let newDouble = Double(newString) {
//                     ints.append(Int(newDouble))
//                 }
//             }
//             let mean = getMean(ints.reduce(0, {sum, next in sum + next}), ints.count)
//             print("\(ints.isEmpty ? "" : "The mean of \(ints) is \(mean)")", terminator: ": ")
//             main()
//         }
//     }
// }

//used by both versions
func getMean(_ sum: Int, _ count: Int) -> Double {
    return (Double(sum) / Double(count))
}

main()
