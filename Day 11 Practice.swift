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
print()


//PROBLEM 7: THE ENCUMBRANCE CHECK
//Create a struct called Inventory with currentWeight (Double) and maxWeight (Double).
//Add a computed property called encumbrancePercentage (Double).
//Get: Return (currentWeight / maxWeight) * 100.
//Set: Update currentWeight to be (newValue / 100) * maxWeight.

struct Inventory {
    var currentWeight: Double
    var maxWeight: Double
//sets up struct and properties as doubles
    var encumbrancePercentage: Double {
        get {
//sets up the computed property
            return (currentWeight / maxWeight) * 100
//calculates the percentage for encumbrance
        }
        set {
            maxWeight = (newValue / 100 * maxWeight)
        }
//reverse-engineers the calculation for maxWeight
    }
}
var bagOfHolding = Inventory(currentWeight: 100, maxWeight: 1000)
print(bagOfHolding.maxWeight)
print(bagOfHolding.encumbrancePercentage)
//creates the bag of holding instance from Inventory struct, and checks
//output to make sure things printed corerctly
print()

//PROBLEM 8: THE MANA POOL
//Create a struct called ManaPool with currentMana (Int) and maxMana (Int). Add a
//computed property called manaPercentage (Int).
//Get: Return mana percentage via computed property
//Set: Update currentMana property accordingly

struct ManaPool {
    var currentMana: Double
    var maxMana: Double
    var manaPercentage: Double {
        get {
            return (currentMana / maxMana) * 100
        }
        set {
         currentMana = (newValue / 100) * maxMana
        }
    }
}
var frazilMana = ManaPool(currentMana: 35, maxMana: 115)
print(frazilMana.currentMana)
print(frazilMana.maxMana)
print(frazilMana.manaPercentage)
print()

//PROBLEM 1: THE BANK ACCOUNT
//Concepts: Access Control, Methods
//Create a struct called BankAccount.
//Give it a private(set) var balance: Double that starts at 0.0.
//Add a mutating func deposit(amount: Double) that adds to the balance.
//Add a mutating func withdraw(amount: Double) -> Bool that subtracts
//from the balance if there are sufficient funds (and returns true),
//or returns false if there aren't.

struct BankAccount {
//creates struct
    private(set) var balance: Double = 0.0
//creates callable, externally-unchangeable balance variable with a
//starting value of 0
    mutating func deposit(amount: Double) {
        balance += amount
//creates a function for adding a double to the balance value
    }
    mutating func withdraw(amount: Double) -> Bool {
        if (balance - amount) >= 0.0 {
//checks to see if the balance would go negative with the withrawal
            balance -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 50.0)
print(account.balance)
print(account.withdraw(amount: 25.0))
print(account.balance)
//makes instance of bankAccount and checks to make sure funcs work
print()

//PROBLEM 2: THE LEVELING SYSTEM
//Concepts: Computed Properties, Methods
//Create a struct called Player.
//Give it a var xp: Int that starts at 0.
//Add a computed property level: Int that returns xp / 1000.
//Add a mutating func completeQuest(reward: Int) that adds to the xp
//and prints a message if the player leveled up.
                        
struct Player {
    private(set) var xp: Int = 1000
//creates struct and a property which starts at 0
   private(set) var level: Int {
       get {
           return xp / 1000
//gives level property instructions for how to calculate value
        }
        set {
            xp = newValue * 1000
//inverts level calculations to give xp property value
        }
    }
    mutating func completeQuest(reward: Int){
        xp += reward
//adds Int to xp property value
    }
}
var frazil = Player()
frazil.completeQuest(reward: 350)
print("Frazil completed a quest and gained xp. They are level \(frazil.level). They are \((1000 * (frazil.level + 1)) - frazil.xp ) points away from \(frazil.level + 1).")
frazil.completeQuest(reward: 700)
print("Frazil completed a quest and gained xp. They are level \(frazil.level). They are \((1000 * (frazil.level + 1)) - frazil.xp ) points away from \(frazil.level + 1).")
//adds xp to frazil, computes math to account for what is needed to level up
print()

//PROBLEM 3: THE ITEM SHOP
//Concepts: Custom Initializers, Methods
//Create a struct called ShopItem.
//Give it let name: String and var price: Int.
//Create a custom initializer that takes a name and a price, but ensures
//the price is never less than 1.
//Add a mutating func applyDiscount(percent: Int) that reduces the
//price by the given percentage.

struct ShopItem {
    let name: String
    var price: Int
//creates struct and properties
    init(name: String, price: Int) {
        self.name = name
        self.price = price
        if self.price == 0 {
            self.price = 1
        }
        //initiates the properties, and changes the default minimum
        //value of price to 1 if it is entered as 0 at initialization
    }
    mutating func applyDiscount(discountPct numerator: Int) {
        price = (price * (100 - numerator)) / 100
//creates discount function applying the discount to the price of the item
    }
}
var tombOfKnowledge = ShopItem(name: "Tomb of Knowledge", price: 42)
tombOfKnowledge.applyDiscount(discountPct: 10)
print(tombOfKnowledge.price)
//prints out the discounted price of the item









