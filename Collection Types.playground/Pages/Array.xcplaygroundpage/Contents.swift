//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

var stringArray = ["a", nil, "b"]
var result = stringArray.compactMap { $0 }.joined(separator: "\n")
print(result)
