//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

var stringArray = ["aString", "bString", "cString", nil, "eString"]
var result = stringArray.compactMap { $0 }.joined(separator: "\n")
print(result)

// 合并字符串数组
let arr1: [String] = ["1", "", "1", "2"]
arr1.joined(separator: "|")  // 1||1|2

// 合并整型数组
let arr2: [Int] = [1, 2, 3, 4]
arr2.map(String.init).joined(separator: "|")

// 拆分字符串
let str1: String = "1,2,,,,3"
str1.split(separator: ",")
str1.components(separatedBy: ",")



