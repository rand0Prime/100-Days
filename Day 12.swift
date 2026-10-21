import Foundation

// classes, inheritance, deinitializers

class Game {
    //creates the class
    var score = 0 {
    //sets variable to start at 0
        didSet {
    //creates a property observer to print anytime the score is updated
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
//creates new instance of the game class
newGame.score += 10
//updates the score of newGame, runs the didSet command since the score was updated

//***SO FAR, this is exactly the same as a struct and the only thing that is different
//is the word 'class' instead of 'struct' being there.

//**INHERITENCE**
//classes can be created based on other classes by using inheritence

class PlayerClass {
    let strength: Int
    //creates the class and defines a constant for strength score
    init(strength: Int) {
        self.strength = strength
    //initializes strength to equal 10 as default
    }
    func printSummary() {
        print("This player has a strength score of \(strength)")
    //creates a method to pring the current strength score of a player
    }
}

class Fighter: PlayerClass {
    //creates new class which pulls properties from parent class PlayerClass
    //and can use them in methods within the new class.
    func inform() {
        let fighterStrength = self.strength + 1
    //adds 1 from strength default score which was initialized in the parent class
        print("Fighters get a +1 to the default strength score of \(strength), giving you a starting strength score of \(fighterStrength)")
    }//creates a method to print a message referencing the 'strength' property from PlayerClass.
    // ** if there were methods inside the parent function, these new classes could run them as well
    override func printSummary() {
        print("Beefy fighters get a bonus to their strength, starting at \(strength).")
        //creates a custom message that prints when printSummary() is called, instead of the
        //default message that is stored in the parent class PlayerClass.
        //Doesn't need to be marked as override if the func is named the same but returns different values
        //compared to the parent class func
    }
    
    
}

final class Mage: PlayerClass {
    //creates another new class which pulls properties from parent class PlayerClass
    //and can also use them in methods within the new class.
    //**marking a class as 'final' means it can inherit from its parent class, but no
    //classes can inherit from the class marked as 'final'
    func inform() {
        let mageStrength = self.strength - 1
    //removes 1 from strength default score which was initialized in the parent class
        print("Mages get a -1 to the default strength score of \(strength), giving you a starting strength score of \(mageStrength)")
    }//creates a method to print a message referencing the 'strength' property from PlayerClass.
    // ** if there were methods inside the parent function, these new classes could run them as well
}

let fighterExample = Fighter(strength: 10)
let mageExample = Mage(strength: 10)
//initializes two constants built from respetive child classes

fighterExample.inform()
mageExample.inform()
//prints the inform messages from each child class

fighterExample.printSummary()
//prints the custom playerSummary method from the child Fighter class body
mageExample.printSummary()
//prints the default playerSummary method from the parent class PlayerClass body
print()

//**ADDING INITIALIZERS TO CLASSES**

class Vehicle {
    let isElectric: Bool
    //creates a class and gives it a property

    init(isElectric: Bool) {
        self.isElectric = isElectric
    //initializes the property
    }
}

class Car: Vehicle {
    let isConvertable: Bool
    //creates new subclass inheriting from super class Vehicle
    
    init(isElectric: Bool, isConvertable: Bool) {
    //adds a new property to this subclass called inConvertable, but xcode wants us to still
    //complete whether this car is electric or not. We do this by adding super.init to
    //the body, which passes information up to the super class Vehicle
        self.isConvertable = isConvertable
    //defines and creates new value inside the subclass for isConvertable
        super.init(isElectric: isElectric)
    //refers back to the super class Vehicle to define isElectric
    }
}

let teslaModel3 = Car(isElectric: true, isConvertable: false)
//creates an instance aod passes properties into the Car subclass
print(teslaModel3.isConvertable)
//prints the value for teslaModel3's isConvertable property
print()

//**COPYING CLASSES**

class Character {
    var name = "Bjol"
}
//creates a class with a single variable

var character1 = Character()
var character2 = character1
character2.name = "OneWord"
//creates two copies of Character, and renames the second one to OneWord

print(character1.name)
print(character2.name)
print()
//prints both new characters to show that the names shared since character2 is equal to character1.
//This allows for copies of data to be shared across the project.

//If we we to only change 'class Character' to 'struct Character', this would not
//result in a copy, since structs create instances rather than multiple copies of
//the same code referencing the same original parent pot of data.

struct Char {
    var name = "Bjol"
}
//creates a struct with a single variable

var char1 = Character()
var char2 = character1
char2.name = "OneWord"
//creates two instances of Character, and renames the second one to OneWord

print(char1.name)
print(char2.name)
print()
//the names print differently because they are separate instances of the struct, and
//changes made to one instance are independent of each other

//if we wanted to have a class return a copy, we can write a method inside the parent class
//to process that work

class Character2 {
    var name = "Bjol"
    //creates a class with a single variable
    
    func copy() -> Character2 {
    //creates a method to create a copy of the class Character2
        let newCharacter = Character2()
    //defines the property within the method
        newCharacter.name = name
    //passes the name method from the Character2 superclass into the subclass Character2 and
    //assigns the new character constant's name value to be equal to the name that is within the
    //Character2 superclass
        return newCharacter
    }
}

//**DEINITIALIZERS**

//deinitializers don't get used with functions, never take parameters / return data
//and are never called directly.

//When the final copy of a class has been destroyed, then the underlying data is
//automatically destroyed, and resources are freed up.

class Item {
    let id: Int
    //creates class Item
    init(id: Int) {
        self.id = id
        print("Item \(id): I'm alive!")
    //initializes the id property and prints this message upon creation
    }
    
    deinit {
        print("Item \(id): I'm Dead!")
    //when the Item deinitializes, this message prints
    }
}

for i in 1...3 {
    let item = Item(id: i)
    print("User \(item.id): I'm in control!")
    
    
    //creates a loop that runs through the range 1 - 3 and prints a message.
}
print()
//when looking at the printout, we can see the order of operations:
//1. item is created in the loop using class Item as reference point
//2. the item is stored temporarily inside the scope of the loop and prints its message
//3. the loop iteration ends, the item is destroyed and the deinit message is printed

//***** IF there were copies of Item stored somewhere else (such as in an array),
//the deinit would not occur until after those items were cleared from the array as well.

//**VARIABLES INSIDE CLASSES**

class damageType {
    var type = "Fire"
}//creates class and initial variable value

let damageType1 = damageType()
damageType1.type = "Ice"
print(damageType1.type)
//creates subclass damageType1 born from superclass damageType and changes the
//value from Fire to Ice.
//***This LOOKS like we are changing a constant (damgeType1 is a constant afterall), but
//what is changing is the variable inside the copy of the damageType superclass

class User {
    var name = "Mavvius"
}

var user = User()
//creates a child class called user from parent class User
user.name = "Fever"
//changes name of user child class to Fever
user = User()
//redirects user to look at parent class User() for reference data
print(user.name)
print()

//shows that parent class is being referenced

//This means we can wind up with four possible scenarios:
// 1. Constant class, constant property
    //signpost that always points to same user, who has the same name
// 2. Constant class, variable property
    //signpost that always points to same user, but their name can change
// 3. Variable class, constant property
    //signpost that can point to different users, but their names never change
// 4. Variable class, variable property
    //signpost that can point to different users, andtheir names can change

//*******CHECKPOINT 7*******

//make a class hierarchy for animals, starting with Animal at the top, then
//Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog,
//and Persian and Lion as subclasses of Cat.

//But there’s more:

//The Animal class should have a legs integer property that tracks how many legs the animal has.
//The Dog class should have a speak() method that prints a generic dog barking string,
//but each of the subclasses should print something slightly different.
//The Cat class should have a matching speak() method, again with each subclass printing something different.
//The Cat class should have an isTame Boolean property, provided using an initializer.

class Animals {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
//creates the parent class of Animals with a variable of legs defined at instance creation

class Dogs: Animals {
    func speak() {
        print("Bark, boof!")
    }
}
//creates child class from Animals and gives a method for speak

class Cats: Animals {
    var isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    //creates a subclass of Animals and gives parameter isTame default value of false.
    //Also initializes isTame which requires the value for legs in parent class Animals
    //to be initialized via super.init, referencing legs in parent class Animals
    func speak() {
        print("Mew, mewooooow!")
        //gives method speak the action of printing a message
    }
}

class Corgi: Dogs {
    override func speak() {
        print("Yip! Such cute, so short legs.")
    }
//creates subclass from Dogs and overrides the speak method with soemthing else unique
//to only the corgi class
}

class Poodle: Dogs {
    override func speak() {
        print("Arf! I am smart.")
    }
}
//creates subclass from Dogs and overrides the speak method with soemthing else unique
//to only the poodle class

class Persian: Cats {
    override func speak() {
        print("Yoooowl, I am regal. Meowth's evolution is based off of my likeness.")
    }
}
//creates subclass from Cats and overrides the speak method with soemthing else unique
//to only the poodle class

class Lion: Cats {
    override func speak() {
        print("Raaaaawwwr, my mane is all knotted up!")
    }
}
//creates subclass from Cats and overrides the speak method with soemthing else unique
//to only the poodle class

let carl = Corgi(legs: 4)
let padme = Poodle(legs: 4)
let pearl = Persian( legs: 4, isTame: false)
let leon = Lion(legs: 4, isTame: true)
//creates constant instances of the subclasses created via parent class Animals

carl.speak()
padme.speak()
pearl.speak()
leon.speak()
//prints the various speak commands from each different child class







