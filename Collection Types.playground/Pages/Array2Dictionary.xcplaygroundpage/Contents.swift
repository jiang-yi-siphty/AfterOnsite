//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct item {
    let type: String
    let propertyA: String
    let propertyB: String
}

var items = [item]()
items.append(item.init(type: "Cat", propertyA: "pA1", propertyB: "pB1"))
items.append(item.init(type: "Cat", propertyA: "pA2", propertyB: "pB2"))
items.append(item.init(type: "Dog", propertyA: "pA3", propertyB: "pB3"))
items.append(item.init(type: "Pig", propertyA: "pA4", propertyB: "pB4"))
items.append(item.init(type: "Pig", propertyA: "pA5", propertyB: "pB5"))

let itemsDic = Dictionary(grouping: items) { $0.type }
dump(itemsDic)

//Rearrange the array as expacted custom order. 
var newItems = [item?]()
newItems.append(itemsDic["Pig"]?[0])
newItems.append(itemsDic["Pig"]?[1])
newItems.append(itemsDic["Dog"]?[0])
newItems.append(itemsDic["Cat"]?[0])
newItems.append(itemsDic["Cat"]?[1])

dump(newItems)
