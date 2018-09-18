//: Playground - noun: a place where people can play

import UIKit

class Animal {
}

protocol Biteable {
    func attack()
}

extension Biteable{
    var attackMethod: String {
        get {
            return "Bite"
        }
    }
    func attack() {
        print(attackMethod)
    }
}

protocol Huntable: Biteable {
}

extension Huntable{
    var attackMethod: String {
        get {
            return "Bite more than once"
        }
        set{}
    }
}

class Predator: Animal, Huntable{

}


let predator = Predator()
predator.attack()

