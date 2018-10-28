//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str.first ?? "-")
str.last
str.append(" append")
str.lowercased()
str
str.capitalized
str
str.uppercased()
str
//str.capitalized(with: Locale?)

var namesOfIntegers = [Int: String]()
// namesOfIntegers 是一个空的 [Int: String] 字典

namesOfIntegers[16] = "sixteen"
namesOfIntegers
// namesOfIntegers 现在包含一个键值对
namesOfIntegers = [:]
// namesOfIntegers 又成为了一个 [Int: String] 类型的空字典

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
