import Foundation

// access control, static properties and methods

struct InventoryManagement {
    var capacity = 100
    var availability = 100
    
    mutating func pickUp(itemWeight: Int) {
        if availability > itemWeight {
            availability -= itemWeight
            print("Item picked up. Remaining availability: \(availability)")
        } else {print("Unable to pick up item; overencumbered by \((itemWeight) - availability)")}
    }
    
    mutating func drop(itemWeight: Int) {
        availability += itemWeight
    }
}// creates a struct for storing items in a backpack with functions to
 // pick up and drop weight

var backpack = InventoryManagement()
// creates a new backpack with 100 capacity and availability
backpack.pickUp(itemWeight: 50)
backpack.drop(itemWeight: 30)
print(backpack.availability)
// creates a backpack from the struct, adds weight, drops some, and prints the current
// availability inside the backpack


// however, since the variables for capacity and availability are outside the struct,
// they are vulnerable to errors in code causing all kinds of trouble like
// negative inventory balances
backpack.capacity -= 10000
print(backpack.capacity)
// results in a negative inventory capacity value, which makes no sense.
// To protect data from being manipulated from outside the struct,
// add 'private' in front of the variable intending to be protected.

struct InventoryManagement2 {
    private var capacity = 100
    private var availability = 100
    // protects  capacity and availability from being modified from anything
    // except for methods inside the struct.
    //*** this means that the initial value must be set from within the struct,
    // and the code would not build if availability = 100 were instead availability: Int ***
    
    mutating func pickUp(itemWeight: Int) {
        if availability > itemWeight {
            availability -= itemWeight
            print("Item picked up. Remaining availability: \(availability)")
        } else {print("Unable to pick up item; overencumbered by \((itemWeight) - availability)")}
    }
    
    mutating func drop(itemWeight: Int) {
        availability += itemWeight
    }
}

var backpack2 = InventoryManagement2()
print()
// creates a backpack from the struct InventoryManagement2, which includes
// access control for the capacity and availability variables
// 'backpack2.capacity -= 1000' would result in a message that says the
// variable is inaccessible due to private access control

// ***OTHER FORMS OF ACCESS CONTROL:***

//private: don't let anything outside the struct use this

//fileprivate: don't let anything outside the current file use this

//public: let anyone, anywhere use this

//private(set): this can be printed and sent out, but not written to except
//    for by using my custom logic (methods)

// ------------------

// STATIC PROPERTIES AND METHODS
// sometimes there will be a need to add a property or method to the struct
// itself instead of an instance of a struct:
// - for example data
// - to store constant data that needs to be accessed in multiple areas of the project


struct Party {
    static var partyCount = 0
    // marking these as static means that these belong to this
    // struct itself, and not to any instance of the struct
    static func add(member: String) {
        print("\(member) joined the party.")
        partyCount += 1
    }
}

Party.add(member: "Bjol")
// this adds Bjol to the Party struct directly, and would mean that
// Bjol is a part of any instance of the Party struct that is made going forward
print(Party.partyCount)

// *** static methods can be read from a non-static method/property ***

//If you want to mix and match static and non-static properties and methods, there are two rules:

//To access non-static code from static code… you’re out of luck: static properties and
//methods can’t refer to non-static properties and methods because it just doesn’t make
//sense – which instance of School would you be referring to?
//To access static code from non-static code, always use your type’s name such as
//Party.partyCount. You can also use Self to refer to the current type.

// check values with lowercase self, check types of structs with uppercase Self

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "todolistmeetsdice.com"
} // this data can be referenced anywhere in the code without fear of having it be manipulated
print(AppData.version)

struct Character {
    let name: String
    let level: Int
    // creates a struct for making characters
    static let example = Character(name: "Bjol", level: 1 )
}   // creates an example character that can be used anywhere in the project,
// such as on the character creation screens when developing the page itself to
// make sure that everything looks the way I would want it to look

//*** CHECKPOINT 6 ***
//--------------------------

// Create a struct to store information about a car. Include:
// model
// number of seats
// current gear
// add a method to change gears up or down
// think about variables and access control
// don't allow invalid gears - 1...10 seems a fair maximum range























