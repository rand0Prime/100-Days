import Foundation

// practice: structs

//PROBLEM 1: THE CHARACTER SHEET
//Concepts: Basic Structs, Properties
//Create a struct called Character.
//Give it three properties: name (String),
//level (Int), and characterClass (String).
//Create an instance of your struct for a character
//named "Luthor" who is a level 1 "Cleric".
//Print out Luthor's name and class.

struct Character {
    let name: String
    var level: Int
    var charClass: String
} // creates character strut with a set of general properties

var luthor = Character(name: "Luthor", level: 3, charClass: "Paladin")
// creates luthor as a variable and assigns its values

print("\(luthor.name) is level \(luthor.level).")
print()

//PROBLEM 2: THE LEVEL UP
//Concepts: Struct Methods, Mutating Methods
//Create a struct called Hero.
//Give it a name (String) and a level (Int).
//Add a mutating func levelUp() that increases the hero's level
//by 1 and prints a congratulatory message.
//Create a variable instance of your hero, check their level,
//call levelUp(), and check their level again.

struct Hero2 {
    let name: String
    var level: Int
    // creates struct and designates general properties
    mutating func levelUp() {
        level += 1
        print("Contrats! \(name) is now level \(level).")
    // creates a mutating function which allows for level to
    // be changed.
    }
}

var Frazil = Hero2(name: "Frazil", level: 4)
// creates instance of Hero
Frazil.levelUp()
// runs the levelUp function and increases Frazil's level by 1
print()

//PROBLEM 3: THE DICE ROLLER
//Concepts: Computed Properties
//Create a struct called Weapon.
//Give it a name (String) and a baseDamage (Int).
//Add a computed property called maxDamage that
//returns the baseDamage multiplied by 2.
//Create a weapon and print out its maxDamage.

struct Weapon {
    let name: String
    let baseDamage: Int
// creates the struct with set properties
    var maxDamage: Int {
        baseDamage * 2
    }// creates a computed property which calculates
     // within the struct
}

let broadsword = Weapon(name: "Broadsword", baseDamage: 5)
print()

//PART 1: THE HERO
//Create a struct called Hero.
//It should have properties for name (String) and hp (Int).
//Add a mutating func takeDamage(amount: Int) that
//subtracts the amount from their hp.
                             
//PART 2: THE MONSTER
//Create a struct called Monster.
//It should have properties for name (String) and attackPower (Int).
//Add a method called attack(target: inout Hero) that calls the
//hero's takeDamage method, passing in the monster's attackPower.
//(Note: The inout keyword lets you modify the hero directly!)
                             
//PART 3: THE BATTLE
//Put it all together!
//Create a Hero named "Nel" with 50 HP.
//Create a Monster named "Goblin" with 10 attack power.
//Have the Goblin attack Nel.
//Print Luthor's remaining HP to make sure it went down!

struct Hero {
    let name: String
    var hp: Int
    // creates the strcut
    mutating func takeDamage(amount: Int) {
        hp -= amount
    }// adds a function which reduces a hero's HP
}

struct Monster {
    let name: String
    var attackPower: Int
    // creates struct for enemy combatants
    func attack(target: inout Hero) {
    // creates attack function which diretly targets a
    // hero created from the Hero struct as target
        target.takeDamage(amount: attackPower)
        // calculates the damage taken as the attack power of the
        // enemy combatant
    }
}

var nel = Hero(name: "Nel", hp: 50)
print(nel.hp)
// creates Nel as a hero from Hero struct, and checks HP value

var goblin = Monster(name: "Goblin", attackPower: 10)
// creates goblin from Monster struct, assigns attack power to = 10
goblin.attack(target: &nel)
// calls the goblin attack function from the struct, and
// designates nel as target with the & symbol
print(nel.hp)
// checks to make sure Nel's HP decreases
print()


//PART 1: THE PALADIN
//Create a struct called Paladin.
//Properties: name (String), hp (Int), and armorClass (Int).
//Method: mutating func takeDamage(amount: Int) that
//subtracts the amount from their hp.

struct Paladin {
    let name: String
    var hp: Int
    var armorClass: Int
    mutating func takeDamage(amount: Int) {
        hp -= amount
    }
}

//PART 2: THE DRAGON
//Create a struct called Dragon.
//Properties: name (String) and attackBonus (Int).
//Method: func attack(target: inout Paladin)
//Inside, roll a d20 (Int.random(in: 1...20)) and add the attackBonus.
//If the total is greater than or equal to the Paladin's
//armorClass, roll a d12 for damage (Int.random(in: 1...12))
//and call the Paladin's takeDamage method.
//Print whether the attack hit or missed!

struct Dragon {
    let name: String
    var attackBonus: Int
    // creates dragon struct
    func attack(target: inout Paladin) {
    // creates attack command, targeting Paladin
        let attackRoll = Int.random(in: 1...20) + attackBonus
    // makes the attack roll of a d20 + attack bonus
        let armorClass = target.armorClass
    // makes the armor class going against the attack roll equal
    // to the armor class of the target, in this case the Paladin instance
    // that is going to be made below
        if attackRoll > armorClass {
            let damageRoll = Int.random(in: 1...12)
            target.hp -= damageRoll
        // damage will be done to Paladin instance equal to a d12 roll
            print("\(name) hits \(target.name) for \(damageRoll) damage!")
        } else {
            print("\(name)'s attack misses \(target.name)!")
        }
    }
}

//PART 3: THE ENCOUNTER
//Create a Paladin named "Kaelen" with 60 HP and an Armor Class of 18.
//Create a Dragon named "Ignis" with an attack bonus of +5.
//Have Ignis attack Kaelen.
//Print Kaelen's remaining HP.

var Kaelin = Paladin(name: "Kaelin", hp: 60, armorClass: 18)
print("\(Kaelin.name) starts with \(Kaelin.hp) HP.")
// creates the Paladin instance and checks starting HP

var Ignis = Dragon(name: "Ignis", attackBonus: 5)
Ignis.attack(target: &Kaelin)
print("Kaelin has \(Kaelin.hp) HP remaining.")
Ignis.attack(target: &Kaelin)
print("Kaelin has \(Kaelin.hp) HP remaining.")
Ignis.attack(target: &Kaelin)
print("Kaelin has \(Kaelin.hp) HP remaining.")
// processes 3 attacks by the dragon against the paladin, and
// applies damage on hits.

print()

//PART 1: THE ITEM
//Create a struct called Item.
//Properties: name (String) and weight (Double).
//
//PART 2: THE ADVENTURER
//Create a struct called Adventurer.
//Properties: name (String), carryCapacity (Double), and
//inventory (an array of Items, starting empty).
//Computed Property: currentWeight (Double) that uses
//    .reduce() to sum up the weight of all items in the inventory.
//
//PART 3: THE LOOTING METHOD
//Add a method to your Adventurer struct.
//Method: mutating func pickUp(item: Item)
//Logic: Check if adding the item's weight to currentWeight
//                    would exceed carryCapacity. If it does,
//print "Too heavy to carry!". If it doesn't, append the item to the inventory.
//                    
//PART 4: THE TREASURE ROOM
//Put it all together!
//Create an Adventurer named "Kaelen" with a carry capacity of 30.0.
//Create three Items: a "Heavy Shield" (weight 15.0), a "Sword" (weight 10.0), and a "Helmet" (weight 8.0).
//Have Kaelen pick up the items one by one.
//Print Kaelen's final currentWeight and the names of the items in their inventory.

struct Item {
    let name: String
    var weight: Double
}
// creates a struct for generating items

struct Adventurer {
    let name: String
    var carryCapacity: Double
    var inventory: Array<Item> = []
    
    var currentWeight: Double {
        inventory.map {$0.weight}.reduce(0.0, +)
    }// sets up computed property for current inventory weight
     // by using the map command on each item's weight, and
     // using 'reduce' to add them all together, starting with
     // with a 0.0 double.
    
    var availableCarryCapacity: Double {
        carryCapacity - currentWeight
    }// makes another computed property to make an easily accessible
     // way of checking availabile carry capacity
    
    mutating func pickUp(item: Item) {
        // creates the ability to pick up items and add to inventory
        if item.weight < availableCarryCapacity {
            inventory.append(item)
            print("Acquired \(item.name).")
        } else {
            print("This item would overencumber you! Time to go to the gym.")
        }
    }
}
// creates a struct for generating adventurers with the
// ability to carry items created from Item struct

var Kaelen = Adventurer(name: "Kaelen", carryCapacity: 30.0)
// creates adventurer Kaelen

let heavyShield = Item(name: "Heavy Shield", weight: 15.0)
let sword = Item(name: "Sword", weight: 10.0)
let helmet = Item(name: "Helmet", weight: 8.0)
// creates items to be interacted with

print(Kaelen.inventory)
// confirms that Kaelen's inventory is empty

Kaelen.pickUp(item: heavyShield)
Kaelen.pickUp(item: sword)
Kaelen.pickUp(item: helmet)
// runs the code to attempt to pick up the items created above,
// checking available carry capacity for each

print(Kaelen.inventory)
// prints Kaelen's inventory, confirming that there was not enough
// carry capacity to pick up the helmet
print()






















