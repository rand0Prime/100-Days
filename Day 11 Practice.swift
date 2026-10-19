import Foundation
// practice: self., get/set

//TOPIC 1: USING SELF. IN INITIALIZERS

//The goal here is to practice using self. when initializer
//parameters share the same name as struct's properties.

//Problem 1: The Simple Hero

//Create a struct called Hero with
//a name (String). Write a custom initializer that takes a
//parameter called name and uses self.name to assign it.

struct Hero {
    var name: String
    // creates the struct
    init(name: String) {
        self.name = name
    // assigns input parameter to the struct's name property
    }
}


//Problem 2: The Stat Block

//Create a struct called Stats with
//strength (Int) and dexterity (Int). Write an initializer that
//takes strength and dexterity as parameters and assigns them using self..

struct Stats {
    var strength: Int
    var dexterity: Int
// creates the struct
    init(strength: Int, dexterity: Int) {
        self.strength = strength
        self.dexterity = dexterity
// assigns input value to the struct's properties
    }
}

//Problem 3: The Weapon

//Create a struct called Weapon with
//damage (Int). Write an initializer that takes damage, but only
//assigns it if the value is greater than 0. If it is not,
//set self.damage to a default of 1.

struct Weapon {
    let damage: Int
    // creates the struct
    init(damage: Int) {
        if damage > 0 {
            self.damage = damage
// assigns input value if it is valid, otherwise defaults to 1
        } else {
            self.damage = 1
// if the damage is created at the callsite as 0, the
// value defaults to 1.
        }
    }
}

let axe = Weapon(damage: 0)
// creates instance of weapon called 'axe' with damage of 0
print(axe.damage)
// confirms that the else portion of the Weapon struct loop ran successfully
print()

//PROBLEM 4: THE SPELL

//Create a struct called Spell with name (String) and level (Int).
//Write an initializer that takes name and level as parameters.
//If the level passed in is less than 1, set self.level to 1.
//Otherwise, set it to the input value.

struct Spell {
    var name: String
    private(set) var level: Int
//    creates the struct, makes level callable but not changeable from ouside the struct
    init(name: String, level: Int) {
        self.name = name
        self.level = level
// assigns input parameters to struct properties
        if level < 1 {
            self.level = 1
// creates default value for property of 1 in case input parameter is < 1
        }
    }
}

var fireball = Spell(name: "Fireball", level: 0)
print(fireball.level)
// confirms the default value works
print()

//PROBLEM 5: THE PARTY
//Create a struct called Party with members (an array of Strings).
//Write an initializer that takes members as a parameter. If the array
//passed in is empty, set self.members to ["The Lone Wanderer"].
//Otherwise, assign the input array.

struct Party {
    var members: [String]
    // creates the struct
    init(members: [String]) {
        self.members = members
        if self.members.count == 0 {
            self.members = ["The Lone Wanderer"]
// assigns members property  default value of 'The Long Wanderer'
// in case the party instance has an empty array when created
        }
    }
}
var theFellowship = Party(members: [])
print(theFellowship.members)
theFellowship.members.append("Gimlee")
print(theFellowship.members)
print()

//PROBLEM 6: THE ARMOR
//Create a struct called Armor with defense (Int) and isHeavy (Bool).
//Write an initializer that takes only defense as a parameter. Set self.defense
//to the input, and set self.isHeavy to true if defense is greater than 10 (otherwise false).

struct Armor {
    let defense: Int
    var isHeavy: Bool
// creates the struct
    init(defense: Int) {
        self.defense = defense
//assigns external parameter as defense value in struct
        if self.defense > 10 {
            self.isHeavy = true
// if external parameter for defense is 11 or higher, the property isHeavy is true
        } else {
            self.isHeavy = false
// if external parameter for defense is 10 or lower, the property isHeavy is false
        }
    }
}
let greatShield = Armor(defense: 10)
print(greatShield.isHeavy)
print()

//TOPIC 2: GET / SET SYNTAX

//The goal here is to practice computed properties that use both a getter
//(to calculate a value) and a setter (to update underlying data).

//Problem 4: The Gold Purse
//Create a struct called Purse with goldPieces (Int).
//Add a computed property called silverPieces (Int).
//Get: Return goldPieces * 10.
//Set: Update goldPieces to be newValue / 10.

struct Purse {
    var goldPieces: Double
// creates the struct and a property for goldPieces
    var silverPieces: Double {
// makes a computed property for silverPieces
        get {
            return goldPieces * 10.0
// creates a get command which calculates and retrieves (gets)
// the computed property for silverPieces and sends it out
        }
        set {
            goldPieces = newValue / 10.0
// creates a set which makes the goldPieces property equal the initial value
// passed in as the external parameter (it converts the new silver value back
// into the gold value)
        }
    }
}
var partyGold = Purse(goldPieces: 4.0)
print(partyGold.goldPieces)
print(partyGold.silverPieces)
print()

//Problem 5: The Health Bar
//Create a struct called HealthBar with currentHP (Double)
//and maxHP (Double). Add a computed property called healthPercentage (Double).
//Get: Return (currentHP / maxHP) * 100.
//Set: Update currentHP to be (newValue / 100) * maxHP.

struct HealthBar {
    var currentHP: Double
    var maxHP: Double
// creates the struct, creates properties for current and max HP
    var healthPercentage: Double {
        get {
            return (currentHP / maxHP) * 100
// creates healthPercentage computed property, and does the math to convert
// current HP into a percentage of max HP
        }
        set {
            currentHP = (newValue / 100) * maxHP
// converts healthPercentage back to current HP double
        }
    }
}
var testHPBar = HealthBar(currentHP: 30.0, maxHP: 40.0)
print(testHPBar)
print(testHPBar.currentHP)
print(testHPBar.maxHP)
print(testHPBar.healthPercentage)
// prints the test readouts of the testHPBar to confirm things are the way they should be


//Problem 6: The Experience Tracker
//Create a struct called Experience with totalXP (Int).
//Add a computed property called level (Int).
//Get: Return totalXP / 1000.
//Set: Update totalXP to be newValue * 1000.

struct Experience {
    var totalXP: Int
//creates the struct and a property for XP
    var level: Int {
//creates the computed property
        get {
            return totalXP / 1000
//assigns the calculations to perform in order to convert XP into level number.
//since it is an Int, it will only return the closest whole number and discards
//the remainder
        }
        set {
            totalXP = newValue * 1000
//coverts level back into experience
        }
    }
}

var luthorXP = Experience(totalXP: 3429)
//creates instance with a set amount of experience
print(luthorXP.level)
//computes and gets the level gained from the set experience
luthorXP.totalXP += 732
//adds xp to banked total
print(luthorXP.level)
//prints the level value again to reflect that enough xp has been gained
//to move to the next level













