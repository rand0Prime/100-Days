import Foundation

// Structs, computed properties, and property observers

//Structs create a data type which allows for multiple items to be grouped together

struct CharacterSheet {
    // the title of the struct is always capitalized
    let name: String
    var level: Int
    var strength: Int
    var intelligence: Int
    var dexterity: Int
    // within the struct, properties are defined as data types instead of actual values.
    // serves as a template to be filled in at the callsite
    //*** these properties can also be set up as initial values instead of Int
    // ex: dexterity: 10 would be perfectly fine
    

    func characterSummary() {
        print("\(name)'s stats: Level - \(level), Strength - \(strength), Dexterity - \(dexterity)")
    }
    //*** ALL properties inside a struct is a constant by default, even if
    // they are marked as a variable, meaning that data inside structs are
    // read-only by default. If we want data to be able to change within
    // a struct, we mark the funct as a mutating function. Example below
}

var luthor = CharacterSheet(name: "Luthor", level: 5, strength: 15, intelligence: 13, dexterity: 14)
var frazil = CharacterSheet(name: "Frazil", level: 4, strength: 12, intelligence: 15, dexterity: 14)
// these initializers fill in the template from the struct when they are created

print(luthor.dexterity)
print(frazil.intelligence)
print()
// from here, properties within the struct can be called in the same way that
// enum cases or tuple values are called

luthor.characterSummary()
frazil.characterSummary()
print()
// the functions within the structs (called a method) can be called the same way

struct Modifiers {
    var strength: Int
    var intelligence: Int
    var dexterity: Int
    
    mutating func updateStrength(increaseBy: Int) {
        strength += increaseBy
    }
    
    mutating func updateIntelligence(increaseBy: Int) {
        intelligence += increaseBy
    }
    
    mutating func updateDexterity(increaseBy: Int) {
        dexterity += increaseBy
    }
}
// 'mutating' indicates that the values inside the struct can be updated

var bek = Modifiers(strength: 2, intelligence: 1, dexterity: 0)

print("Bek's modifiers -  Strength: \(bek.strength), Intelligence: \(bek.intelligence), Dexterity: \(bek.dexterity)")

bek.updateStrength(increaseBy: 1)
// runs a function that updates the modifier for bek's strength
print("Bek's modifiers -  Strength: \(bek.strength), Intelligence: \(bek.intelligence), Dexterity: \(bek.dexterity)")
// running the exact same line of code as before the update shows that the
// value from within the struct itself has changed
print()

// we can also perform dynamic caluclations within the structure itself

struct BaseStatsAndMods {
    let baseStrength = 10
    let baseDexterity = 12
    let baseIntelligence = 12
    var strengthMod: Int
    var dexMod: Int
    var intMod: Int
    // starts off with base values locked as constants, and variables for changing modifiers
    
    var strength: Int {
        baseStrength + strengthMod
    }
    
    var dexterity: Int {
        baseDexterity + dexMod
    }
    
    var intelligence: Int {
        baseIntelligence + intMod
    }
    // these three closures run computations each time they are called
    // so we can preserve the base values for later reference while
    // being able to dynamically update them as the score increases
}

var mavvius = BaseStatsAndMods(strengthMod: 1, dexMod: 3, intMod: 1)
// this assigns all the base stats to mavvius, while asking for initial values for the modifiers

print(mavvius.baseStrength)
print(mavvius.strengthMod)
print(mavvius.strength)
// prints the base strength, the strength mod, and total strength for mavvius,
// and pulls all properties from the struct and calculates values based on
print()

// property observers do work whenever a condition is met

struct battleHP {
    var hitPoints = 50
}

var goblin = battleHP()

goblin.hitPoints -= 10
print("Goblin takes damge! \(goblin.hitPoints) HP  remaining.")
goblin.hitPoints -= 6
print("Goblin takes damge! \(goblin.hitPoints) HP  remaining.")
goblin.hitPoints -= 14
print("Goblin takes damge! \(goblin.hitPoints) HP  remaining.")
print()


// this is a lot of code to continually type out. instead, we can
// create a property observer within the struct itself which
// triggers each time a specific condition occurs

struct battleHP2 {
    var hitPoints2 = 50 {
        // we add an open curly brace here to create a closure
        didSet {
            // add this didSet to occur each time the var hitPoints is
            // changed
            print("Goblin takes damge! \(hitPoints2) HP  remaining.")
            // change the print string interpolation to the property inside the struct.
            // this attaches the observer to hitPoints2 to monitor whenever it changes
        }
    }
}

var goblin2 = battleHP2()
goblin2.hitPoints2 -= 10
goblin2.hitPoints2 -= 6
goblin2.hitPoints2 -= 14
// changes hitPoints2 for goblin2, and prints the observed property in the print command
print()


struct App {
    var contacts = [String]() {
        // creates the variable contacts as an array of strings within the struct
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        // prints the first line before a change is made to the contacts array;
        // prints the second line before a new value is added to the array
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        // prints the first line after the new contact was added,
        // prints the second line after the first, and references
        // the previous value which was the total array prior to
        // the most recent addition
        }
    }
}

var app = App()
// initializes the variable
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
// adds three contacts, triggering the property observer for each addition

print()

// custom initializers give us more control over additional fields when
// creating instances via those structs

struct Player {
    let name: String
    let level: Int
    // creates a struct for new player creation.
    
    // the code below does the same thing, but leaves
    // room for additional fields as needed
    init(name: String) {
        // does not include the 'func' title,
        // and does not contain a return type
        self.name = name
        level = Int.random(in: 1...10)
        // self.___ means the property belongs to the player instance and
        // to set that to the parameter ___.
        // before the code can compile successfully, all properties must have initial values
    }
}

let player = Player(name: "Dexter")
// creates a new instance of struct Player, which takes input from callsite for property 'name'
print(player.level)
// prints the randomly generated level, but re-generates it everytime it is called




















