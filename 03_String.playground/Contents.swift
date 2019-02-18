
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Empty String

let anEmptyString = ""
let anotherEmptyString = String()

if anEmptyString.isEmpty {
    print("Yes, it's empty.")
}

////////////////////////////////////////////////////////////////////////////////
// Copy when assign a String

var nameA = "Tom"
var nameB = nameA
nameB = "Jack"
print(nameA) // nameA is still "Tom".

////////////////////////////////////////////////////////////////////////////////
// Characters

for char in "Hello".characters {
    print(char, terminator: "")
}
print()

////////////////////////////////////////////////////////////////////////////////
// Concatenate

var hello = "Hello"
hello += " World!"

hello = "Hello"
hello.append(" World")
hello.append(Character("!"))

////////////////////////////////////////////////////////////////////////////////
// Interpolation

var name = "Tom"
var sayName = "My name is \(name)."

////////////////////////////////////////////////////////////////////////////////
// Index

var helloWorld = "Hello World!"
helloWorld[helloWorld.startIndex] // H
helloWorld[helloWorld.index(after: helloWorld.startIndex)] // e
//helloWorld[helloWorld.startIndex.advancedBy(1)] // e
//helloWorld[helloWorld.endIndex.advancedBy(-1)] // !
//helloWorld[helloWorld.endIndex.predecessor()] // !
helloWorld[helloWorld.index(before: helloWorld.endIndex)] // H

for index in helloWorld.characters.indices {
    print("\(helloWorld[index])", terminator: "")
}
print()

////////////////////////////////////////////////////////////////////////////////
// Insert and Remove

var welcome = "Hello"

welcome.insert("!", at: welcome.endIndex) // Hello!
//welcome.insert(" World".,at: welcome.startIndex.advancedBy(5)) // Hello World!
welcome.insert(contentsOf: " World", at: welcome.index(welcome.startIndex, offsetBy: 5))
//welcome.remove(welcome.endIndex.predecessor()) // Hello World
welcome.remove(at: welcome.index(before: helloWorld.endIndex))
let range = welcome.index(welcome.startIndex, offsetBy: 5)..<welcome.endIndex
//welcome.removeRange(range)
welcome.removeSubrange(range)

////////////////////////////////////////////////////////////////////////////////
// Prefix Suffix

let fullName = "Tom Wang"
fullName.hasPrefix("Tom") // true
fullName.hasSuffix("Wang") // true





