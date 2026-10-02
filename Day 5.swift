import Foundation

// If/else statements ahd condition checks

// conditional syntax (<, >, =) also works for strings, and will consider alphabetical placement instead of numerical

var roll = 17
var armorClass = 16
// establish some variables for the if statements to process

if roll >= armorClass {
    print("Attack hits! Roll damage.")
}

if roll < armorClass {
    print("Attack misses!")
}

roll = 14
// updates var roll to new value fron future dice roll

if roll >= armorClass {
    print("Attack hits! Roll damage.")
}

if roll < armorClass {
    print("Attack misses!")
}
// re-runs the print statement tree

print(roll)
// prints the current value of var roll

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)
// this will create an array, add a 4th value, and then remove the oldest value, prompting the readout to be 2, 3, 4 instead of 1, 2, 3

let charName1 = "Luthor"

if charName1 == "Bjol" {
    print("Hello Bjol, welcome to Tal'Dori!")
}

if charName1 == "Luthor" {
    print("Neverember is looking for you.")
}

if charName1 != "Frazil" {
    print("You're not Frazil, do you know where she's run off to?")
}
// the == symbol is an equality syntax which tells the if statement to check for whether a value is equal to whatever the check is looking for
// the != does the opposite, and proceeds to the actions within the curly braces if a value does not equal the check

// the checks for the attack roll vs armorClass and any other if statement can be made more efficient by adding an else line
// ex:

if roll >= armorClass {
    print("Attack hits! Roll damage.")
} else {

    print("Attack misses!")
}
// this uses the most recently updated value for var roll

roll = 19
// this updates the attack roll again

if roll >= armorClass {
    print("Attack hits! Roll damage.")
} else {
// a much cleaner way of writing line 26's code
    print("Attack misses!")
}

// if else can be continued with another nested if following it
//ex:

if charName1 == "Luthor" {
    print("Welcome to Tal'Dori, \(charName1)!")
} else if charName1 == "Frazil" {
    print("Where have you BEEN?!")
}
    else {
        print("You're not Frazil, do you know where she's run off to?")
    }

// we can use && as 'and' to join 2 conditions into the same check

if charName1 == "Luthor" && roll > armorClass {
    print("Great roll, \(charName1)!")
}

// we can use || as 'or' to allow for code to run if one of multiple conditiosn to be true
// ex:

if charName1 == "Luthor" || charName1 == "Frazil" {
    print("I know the two of you have seen some terrible things in your journeys together.")
}

// these can be used in enums as well
enum CharClass {
    case paladin, cleric, fighter, druid
}

let paladin = "\(CharClass.paladin)"
let cleric = "\(CharClass.cleric)"
let fighter = "\(CharClass.fighter)"
let druid = "\(CharClass.druid)"
//assigns constants to enum class types for easier readability

var LuthorClass = [String] ()
var FrazilClass = [String] ()
// arrays created to contain the classes of each character

LuthorClass.append(cleric)
LuthorClass.append(paladin)
// Luthor multiclasses as a cleric paladin

FrazilClass.append(druid)
// Frazil is a solo class druid

if LuthorClass.contains(cleric) || LuthorClass.contains(paladin) {
    if FrazilClass.contains(druid) {
        print("Thank goodness we have two healers in our party!")
    }
}
// This will print the message if there is either a cleric or paladin as well as a druid in the party

print("luthor is a \(LuthorClass[0]) \(LuthorClass[1]).")

// the switch command can replace if else blocks by usine cases like an enum

let race = "Orc"

switch race {
case "Human":
    print("Humans are rare around here... why have you come to see us?")
case "Elf":
    print("ENEMY!")
case "Orc":
    print("Welcome, family.")
default:
    print("... Who are you?")
}
// this code is much cleaner than if there were to be 4 or 5 nested if/else statements

// ternary conditional checks can replace some if/then statements
// they check a condition and then process differently depending on whether the condition is true or false

var damageRoll = 4
var enemyHP = 7
let enemyLives = damageRoll >= enemyHP ? "No" : "Yes"
// this sets values for the damage roll and enemy hp, and then assigns a constant string of whether or not the enemy is alive or dead.

print(enemyLives)

// this can also be written more efficiently and without assigning the enemyLives constant:
print(damageRoll > enemyHP ? "No" : "Yes")

print("")

// PROBLEM 1: THE DAILY STREAK MULTIPLIER
// Concepts: Variables, Conditionals, Ternary Operator
// Create a variable called dailyStreak and set it to an integer. Then, create a constant called baseXP set to 50. Use a ternary operator to calculate the final XP awarded: if the dailyStreak is greater than or equal to 7, multiply the baseXP by 2; otherwise, just award the baseXP. Finally, print the result.

var dailyStreak = 7
let baseXP = 50

print("Quest complete. XP gained: \(dailyStreak >= 7 ? baseXP * 2 : baseXP).")
print("")

// PROBLEM 2: THE PARTY ROSTER CHECK
// Concepts: Arrays, Sets, if/else
// Create an array called currentParty containing the names of four party members, with one name duplicated (e.g., "Luthor", "Frazil", "OneWord", "Luthor"). Then, create a Set from that array to remove duplicates. Write an if/else statement that checks if the count of the Set is less than the count of the array. If it is, print a warning that duplicate members are not allowed. Otherwise, print that the party is valid.

var currentParty = ["Luthor", "Frazil", "OneWord", "Luthor"]
var currentPartyCheck = Set(currentParty)

let partySize = currentPartyCheck.count

if partySize < currentParty.count {
    print("Warning, duplicate party members are not allowed.")
} else {
    print("Party may proceed to quest.")
}
    
print("")

// PROBLEM 3: THE QUEST BOARD
// Concepts: Enums, Dictionaries, switch Statements
// Create an enum called QuestDifficulty with cases for easy, medium, and hard. Next, create a dictionary called activeQuests where the keys are quest names (Strings) and the values are their QuestDifficulty. Add at least two quests. Finally, pick one quest from the dictionary and use a switch statement to print a custom message based on its difficulty (e.g., "This should be a quick task!" for easy, or "Prepare for a real challenge!" for hard).

enum QuestDifficulty {
    case easy, medium, hard
}
let easyQuest = QuestDifficulty.easy
let medQuest = QuestDifficulty.medium
let hardQuest = QuestDifficulty.hard

var activeQuests: [String: QuestDifficulty] = [
    "Clearing the Cave": .easy,
    "Find Carl's Missing Sandal": .medium,
    "Persuade the Dragon to Leave": .hard
]

activeQuests["Defend Against the Trolls"] = .medium
activeQuests["Upgrade a Weapon"] = .easy

switch activeQuests["Persuade the Dragon to Leave"] {
case .easy:
    print("This will be a cakewalk")
case .medium:
    print("Be sure to rest before you head out.")
case .hard:
    print("Be sure to say goodbye to your loved ones... it could be the last time they see you.")
default:
    print("Hmmm...")
}


