import Foundation

//classes, inheritance, deinitialization

//PROBLEM 1: THE BASIC NPC
//Concepts: Basic Class, Properties
//Create a class called NPC.
//Give it a name (String) and a role (String).
//Create an initializer to set both properties.
//Create an instance of NPC and print their name.

class NPC {
    let name: String
    var role: String
    init(name: String, role: String) {
        self.name = name
        self.role = role
    }
}

let cabbageSalesman = NPC(name: "Cai", role: "Merchant")
print(cabbageSalesman.name)

//PROBLEM 2: THE LEVELING SYSTEM
//Concepts: Methods
//Create a class called Player.
//Give it a name (String) and a level (Int) that defaults to 1.
//Add a method called levelUp() that increases the level by 1.
//Create an instance, level them up, and print their new level.

class Player {
    let name: String
    var level: Int
    
    init(name: String, level: Int = 1) {
        self.name = name
        self.level = level
    }
    
    func levelUp() {
        level += 1
    }
}

let luthor = Player(name: "Luthor")
print(luthor.level)
luthor.levelUp()
print(luthor.level)
print()

//PROBLEM 3: THE VEHICLE HIERARCHY
//Concepts: Inheritance
//Create a base class called Vehicle with a speed (Int) property.
//Create a subclass called Bicycle that inherits from Vehicle.
//Add a hasBasket (Bool) property to Bicycle.
//Create an instance of Bicycle and set both properties.

class Vehicle {
    let speed: Int
    init(speed: Int) {
        self.speed = speed
            //initializes speed property
    }
}

class Bicycle: Vehicle {
    var hasBasket: Bool
    //creates new property for this class
    init(speed: Int, hasBasket: Bool) {
        self.hasBasket = hasBasket
        //initilaizes hasBasket property
        super.init(speed: speed)
        //initializes inherited property of speed
    }
}

let Schwinn = Bicycle(speed: 6, hasBasket: true)
print(Schwinn.speed)
print(Schwinn.hasBasket)
print()

//PROBLEM 4: THE MAGIC SPELL
//Concepts: Overriding Methods
//Create a base class called Spell with a method cast() that prints
//"A generic spell is cast!".
//Create a subclass called Fireball that overrides cast() to print
//"A fiery explosion erupts!".
//Create an instance of Fireball and call cast().

class Spell {
    func cast() {
        print("A generic spell is cast!")
    }
}

class Fireball: Spell {
    override func cast() {
        print("A firey explosion erupts!")
    //overrides the parent class print call with this new one
    }
}

let fireball = Fireball()
fireball.cast()
//creates an instance of fireball from the Fireball subclass
//and prints the override function of cast()
print()

//PROBLEM 5: THE ARMOR
//Concepts: Custom Initializers & super.init
//Create a base class called Equipment with a weight (Double) property.
//Create a subclass called Armor that adds a defense (Int) property.
//Write a custom initializer for Armor that takes both weight and defense,
//calling super.init for the weight.

class Equipment {
    let weight: Double
    init(weight: Double) {
        self.weight = weight
    }
}

class Armor: Equipment {
    let defense: Int
    init(weight: Double, defense: Int) {
        self.defense = defense
        super.init(weight: weight)
    }
}

let studdedWraps = Armor(weight: 3.0, defense: 5)
print(studdedWraps.weight)
print(studdedWraps.defense)

//PROBLEM 6: THE FINAL BOSS
//Concepts: Deinitializers
//Create a class called Boss.
//Give it a name (String) property.
//Add a deinit that prints "[Name] has been defeated and drops their loot!".
//Create an instance inside a do block (or just set it to nil if using
//an optional) to trigger the deinitializer.

class Boss {
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) has been defeated and drops their loot!")
    }//creates an action for when the last instance of this class is destroyed,
     //in this case it will print a message
}

do {
    //do creates a temporary scope, and at the end of that code block
    //all code inside of it is destroyed. Mephisto being destroyed is what triggers
    //the deinit from the parent class
    let mephisto = Boss(name: "Mephisto")
   
}
print()

//PROBLEM 7: THE SHARED INVENTORY
//Concepts: Reference Types
//Create a class called Inventory with an array of items (Strings).
//Create an instance called player1Inventory.
//Create a second variable player2Inventory and assign it to player1Inventory.
//Add an item to player1Inventory and print
//player2Inventory.items to see that it also changed.

class Inventory {
    var items = [String]()
}

let playerInventory = Inventory()
var player2Inventory = playerInventory

playerInventory.items.append("Scimitar")
print(player2Inventory.items)
print()

//PROBLEM 8: THE ULTIMATE CHARACTER
//Concepts: Putting it all together
//Create a base class GameEntity with an id (Int).
//Create a subclass Combatant that inherits from GameEntity and adds hp (Int).
//Create a subclass Mage that inherits from Combatant and adds mana (Int).
//Override a describe() method in Mage to print all three properties.

class GameEntity {
    let id: (Int)
    init(id: Int) {
        self.id = id
    }
}

class Combatant: GameEntity {
    var hp: Int
    init(id: Int, hp: Int) {
        self.hp = hp
        super.init(id: id)
    //initializes the properties, including the super.init for the inherited id property
        
    }
}

class Mage: Combatant {
    var mana: Int
    init(id: Int, hp: Int, mana: Int) {
        self.mana = mana
        super.init(id: id, hp: hp)
    }
    func describe() {
        print("ID: \(id)")
        print("HP: \(hp)")
        print("Mana: \(mana)")
    //initializes the properties, including the super.init for the inherited id & HP properties
    }
}

let nel = Mage(id: 1, hp: 25, mana: 50)
nel.describe()



