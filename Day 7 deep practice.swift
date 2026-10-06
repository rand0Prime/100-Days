import Foundation

// THE PROBLEM: THE TAVERN REST
// Your party has just finished a long dungeon crawl and needs to rest at the tavern. You need to calculate the total cost of their stay.
//The Dictionary: Create a dictionary called partyRooms where the keys are your party members' names (Strings) and the values are the type of room they want (Strings: "Standard", "Suite", or "Hayloft"). Add at least four members.
// The Function: Write a function called calculateTab that accepts one parameter: a dictionary of type [String: String].
// The Loop: Inside the function, use a for loop to iterate through the dictionary.
// The Logic: Inside the loop, use an if/else or switch statement to determine the cost of the room:
// "Hayloft" = 5 gold
// "Standard" = 10 gold
// "Suite" = 25 gold
// The Output: Keep a running total of the gold spent and print out the final tab for the whole party at the end of the function.

var partyRooms = [
    
    "Frazil": "Standard",
    "OneWord": "Hayloft",
    "Mavvius": "Suite",
    "Bek": "Standard"
    // this dictionary determines the types of room each person stays in
]

func calculateTab(_ partyRooms: [String: String]) {
    // defines the function, and states it will only accept data type String-String from dictionary partyRooms
    var totalCost = 0
        
        for (name, roomType) in partyRooms {
            
            if roomType == "Standard" {
                let roomCost = 10
                totalCost += roomCost
                print("\(name)'s \(roomType) room costs \(roomCost), bringing the total stay to \(totalCost) gold.")
                
            } else if roomType == "Hayloft" {
                let roomCost = 5
                totalCost += roomCost
                print("\(name)'s \(roomType) room costs \(roomCost), bringing the total stay to \(totalCost) gold.")
               
                
            } else if roomType == "Suite" {
                let roomCost = 25
                totalCost += roomCost
                print("\(name)'s \(roomType) room costs \(roomCost), bringing the total stay to \(totalCost) gold.")
                
            }
        }
    
    print("The total cost of the night's stay is \(totalCost) gold.")

}

calculateTab(partyRooms)

// You need to check your party's daily quests and see which ones are ready to be turned in.
// ✅ The Dictionary: Create a dictionary called questLog where the keys are the quest names (Strings) and the values are a Bool representing whether the quest is completed (true or false). Add at least four quests, some completed and some not.
// The Function: Write a function called checkQuests that accepts one parameter: a dictionary of type [String: Bool].
// The Loop: Inside the function, use a for loop to iterate through the dictionary.
// The Logic: Inside the loop, use an if statement to check if the quest's value is true.
// The Output: If it is true, print "The quest '[Quest Name]' is complete! Turn it in for XP." If it is false, print "You still need to finish '[Quest Name]'."
// The Call: Call your function and pass your questLog dictionary into it.

var questLog: [String: Bool] = [
    
    "Finding the Crow": true,
    "Defend the Town": false,
    "Reach Level 5": false,
    "Defeat the Hive Guard": true
] // creates the dictionary containing the quests and their statuses



func checkQuests(_ Dictionary: [String: Bool]) {
    // Creates the function and defines what type of parameter will be accepted.
    // Also hides the title 'Dictionary' from the callsite when running the function!
    for (quest, status) in questLog {
        // equates 'quest' to the keys and 'status' to the values in the dictionary
        status == true ? print("'\(quest)' is complete! Turn it in for XP.") : print("You still need to finish '\(quest)'.")
        } // checks the status of the values in the dictionary before deciding what to print
    }

checkQuests(questLog)

// PROBLEM 1: THE INVENTORY CHECK (EASY)
// Concepts: Arrays, Loops, Functions
// Create an array of strings called bagOfHolding containing five different items (e.g., "Sword", "Shield", "Potion").
// Write a function called checkInventory that accepts an array of strings.
// Inside the function, use a for loop to print "You have a [Item]" for each item in the array.
// Call the function and pass your inventory array into it.

var bagOfHolding = [
    "sleeping bag",
    "lantern",
    "rations",
    "rope",
    "sword"
]
//creates the array of names

func checkInventory(_ Array: [String]) {
    var currentInventoryMessage = "You currently have a "
    for item in Array {
    currentInventoryMessage += "\(item), "
    }
    print(currentInventoryMessage)
}

checkInventory(bagOfHolding)

//PROBLEM 2: THE STAT BOOSTER (MEDIUM)
//Concepts: Dictionaries, Functions, Conditionals
//Create a dictionary called characterStats with keys for "Strength", "Dexterity", and "Intelligence", all set to 10.
//Write a function called levelUp that accepts a dictionary of type [String: Int] and a stat name (String).
//Inside the function, check if the stat exists in the dictionary. If it does, print "Your [Stat] is now [Value + 2]!".
//Call the function to level up your "Strength".

var characterStats: [String: Int] = [
    "Strength": 10,
    "Dexterity": 10,
    "Intelligence": 10
]// defines the dictionary of stats

let availableStats = Set([characterStats])

func levelUpStats(_ Dictionary: [String: Int]) {
    var strength = 0
    strength += characterStats["Strength", default: 0]
    var dexterity = 0
    dexterity += characterStats["Dexterity", default: 0]
    var intelligence = 0
    intelligence += characterStats["Intelligence", default: 0]
    if strength + dexterity + intelligence != 0 {
        for (stat, score) in Dictionary {
            print("Your \(stat) score of \(characterStats[(stat), default: 0]) increased to \(characterStats[(stat), default: 0] + score).")
        }// lines 125 - 131 were my way of checking to see if the stat names were
        // in the dictionary, because I didn't know that keys,contains existed 🤣
    }
}
    levelUpStats(["Strength" : 6])
    // this runs the function with the external parameters of "Strength" and "6"

//PROBLEM 3: THE HERO'S PROFILE (HARD)
//Concepts: Tuples, Functions
//Write a function called createHero that accepts a name (String) and a class (String).
//The function should return a tuple containing the name, the class, and a starting health of 100.
//Call the function and store the result in a constant called myHero.
//Print "Meet [Name], the [Class]! They have [Health] HP." using your tuple.

func createHero() -> (name: String, class: String, baseHP: Int) {
    // creates a tuple with the expected parameters of a string, string, Int
    // and their extensions (.name, .class, .baseHP)
    
    let charName = "Luthor"
    let charClass = "Cleric"
    let baseHP = 100
    // assigns parameters to their values
    
    return (charName, charClass, baseHP)
}   // tells the tuple to spit out a tuple with the inside parameters
    // in place of the external parameter placeholders:
    // name: charName, class: charClass, baseHP: baseHP

let myHero = createHero() // saves the tuple as a constant to be used
print("Meet \(myHero.name), the \(myHero.class)! They have \(myHero.baseHP) HP.")
// uses the tuple with the extensions which were described inside the function

//PROBLEM 4: THE PARTY ROSTER (VERY HARD)
//Concepts: Arrays of Tuples, Loops, Functions
//Create an array of tuples, where each tuple contains a hero's name (String) and their level (Int). Add three heroes to the array.
//Write a function called printRoster that accepts this array of tuples.
//Inside the function, use a for loop to iterate through the array and print "[Name] is Level [Level]".
//Call the function and pass your array of tuples into it.


func heroCreation1() -> (name: String, level: Int) {
    let charName = "Frazil"
    let charLevel = 4
    
    return (charName, charLevel)
}// creates a tuple for a character

func heroCreation2() -> (name: String, level: Int) {
    let charName = "Fever"
    let charLevel = 4
    
    return (charName, charLevel)
}// creates another tuple for a character

func heroCreation3() -> (name: String, level: Int) {
    let charName = "OneWord"
    let charLevel = 5
    
    return (charName, charLevel)
}// creates another tuple for a character


let hero1 = heroCreation1()
let hero2 = heroCreation2()
let hero3 = heroCreation3()
// defines constants for each character tuple created by their functions

var partyMembers = [
    hero1, hero2, hero3
]
// creates array of tuples as defined by their constants

func printRoster() {
    for member in partyMembers {
        // tells function to insert hero tuples 1-3 in place of member parameter
        print("\(member.name) is level \(member.level)")
        // uses the constants defined in creation functions (.name, .level)
        // and references each value specific to each hero 1-3
    }
}
printRoster()

//This solution is a product of how I interpreted the problem. After reviewing
//the problem further I think I could have made the array of tuples directly
//and then passed those through the printRoster function, but hey, this was
//just more practice in making tuples via a function with return values! :)


















