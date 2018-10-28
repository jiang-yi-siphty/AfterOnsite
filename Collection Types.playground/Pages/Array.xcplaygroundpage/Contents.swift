//: [Previous](@previous)

import Foundation

// MARK: -  Array <---> String
print("\n===== Array <---> String =====")

//1.
print("\n1. ")
// [String?] --> String   (remove nil)
var stringArray = ["aString", "bString", "cString", nil, "eString"]
var result = stringArray.compactMap { $0 }.joined(separator: " | ")
print(result)


//2.
print("\n2. ")
// [String] --> String   (remove ""）
let arr1: [String] = ["1", "", "1", "2", "", "1", "", "2", "3"]
let arr1String = arr1.compactMap {($0.count != 0) ? $0 : nil}.joined(separator: "|")  // 1||1|2
print(arr1String)

//3.
print("\n3. ")
// Remove duplicate elements
arr1
let set1 = Set(arr1)
let cleanArr = Array(set1)
print(cleanArr)

//4.
print("\n4. ")
// [Int] --> String
let arr2 = [1, 2, 3, 4]
let arrString = arr2.map(String.init).joined(separator: "|")
print(arrString)

//5.
print("\n5. ")
// String --> Array
let str1 = "1,2,,,,3"
print(str1.split(separator: ","))
print(str1.components(separatedBy: ","))


// MARK: - Enumerate Array
print("\n===== Enumerate Array =====")
//1.
print("\n1. ")
let arr3 = ["A", "B", "C", "D", "E"]
for el in arr3 {
    print("element - \(el)")
}

//2.
print("\n2. ")
let arr: [Any] = [1, 2, 3, "foo", 4, "bar", 5]
for (i, el) in arr.enumerated() where el is String {
    print("\(i) - \(el)")
}

//3.
print("\n3. ")

for (i, c) in "Swift".enumerated() {
    print("\(i): '\(c)'")
}

//4.
print("\n4. ")
var arr5 = ["🥚","🐓", "🐣", "🐥", "🍗", "🐔", "🍳", "🐤"]
arr5.sort()

for (i, el) in arr5.enumerated() where el > "🐔"{
    print("index: (\(i)) - \(el)")
}
