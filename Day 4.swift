import Foundation

// type annotations, complex data types continued

// a variable or constant (including arrays) can be created with a null value, accomplished by telling it which type of data it is going to be

// instead of saying let username = ron, if we don't know what the username will be but know there will be one, we can write it as:
// let username: String (colon is important here instead of equals sign)
// this tells Swift to keep the spot for this username open and it can be added later by simply typing:
// username = "ron" - since we have already created the variable we don't need to call the let command again as the constant username can be updated

// Checkpoint 2 Problem
// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array

var partyMembers: [String] = [String]()

// I could have just added the names into the array directly, but I want the practice in adding things after an array is created, as well as practice in creating empty arrays

var namesList = Set(partyMembers)
// I think I also could have said var nameList = Set<String> ([]), but after I completed the problem I proceeded to watch the hints portion of the video and Paul mentioned you can make a set out of an array and that blew my mind. 😂


print("There are currently \(partyMembers.count) members in the party.")

print(" ")

partyMembers.append("G")
partyMembers.append("Da")
partyMembers.append("G")
partyMembers.append("Do")
partyMembers.append("F")


let member1: String
let member2: String
let member3: String
let member4: String
let member5: String
// I just wanted the practice in creating empty constants. I know that the code block above is not necessary and is extra code, but the practice was good.

member1 = partyMembers[0]
member2 = partyMembers[1]
member3 = partyMembers[2]
member4 = partyMembers[3]
member5 = partyMembers[4]
// I could have instead just made member1 = partyMembers[0] etc, but again the practice in the coding was what I was after. Not trying to make the code efficient here, just wanting to get practice in assignments. 

namesList.insert(member1)
namesList.insert(member2)
namesList.insert(member3)
namesList.insert(member4)
namesList.insert(member5)

let uniqueNames = namesList.count

print("There are now \(partyMembers.count) members in the party with \(uniqueNames) unique names")

print(" ")

// Problem 1: The Quest Board (Enums & Dictionaries)
// Create an enum called Difficulty with cases for easy, medium, and hard.
// Create a dictionary called questLog where the keys are habit names (Strings) and the values are their Difficulty. Add at least three habits.
// Print the difficulty of one of your habits using the default: parameter.

enum questDifficulty {
    case easy, medium, hard
}

var questLog = [String: questDifficulty]()
    questLog["The Dish Disaster"] = .easy
    questLog["Soap Scandal"] = .hard
    questLog["Vacuum Victims"] = .medium

print("The Dish Disaster quest is listed as \(questLog["The Dish Disaster", default: .easy]), while the Soap Scandal quest is listed as \(questLog["Soap Scandal", default: .easy]).")

print(" ")

// Problem 2: The Character Sheet
// Create a dictionary called characterStats that maps the strings "Strength", "Dexterity", and "Intelligence" to integer values (e.g., 14, 16, 12).
// Create a variable called currentStrength by reading the "Strength" value from your dictionary (use a default of 10).
// Add 2 to currentStrength and print the new value.

var characterStats = [String: Int]()
characterStats["Strength"] = 14
characterStats["Dexterity"] = 16
characterStats["Intelligence"] = 12

var currentStrength = characterStats["Strength", default: 0]
currentStrength += 2

print("Your strength started out at \(characterStats["Strength", default: 0]) but after leveling a few times it is now \(currentStrength).")

print(" ")

// The Task: The Daily Party Check-In
// The Enum: Create an enum called Status with cases for active, resting, and fainted.
// The Dictionary: Create a dictionary called partyStatus that maps three of your friends' names to their current Status.
// The Set: Create a set called completedDailies containing the names of the friends who have finished their habits today.
// The Output: Write a print statement that checks if a specific friend is in the completedDailies set. Then, print their current status from the dictionary (using a default of .resting).

enum status {
    case active, resting, fainted
}

let adventuringParty = ["Luthor", "Frazil", "OneWord"]

var partyStatus = [String: status]()
partyStatus["Frazil"] = .active
partyStatus["Luthor"] = .fainted
partyStatus["OneWord"] = .active

var completedDailies = Set(adventuringParty)
completedDailies.remove(adventuringParty[0])

print(completedDailies.contains("Luthor"))
print("\(adventuringParty[0]) has not completed their dailies because they have \(partyStatus["\(adventuringParty[0])", default: .active]).")

print(" ")

// I know I could have made constants to improve the readability of this code, but I wanted the practice in referring to array and set items.

// The Task: The Habit Reward System
// The Enum: Create an enum called RewardType with cases for experience, gold, and item.
// The Dictionary: Create a dictionary called habitRewards that maps three different habits (as Strings) to a RewardType.
// The Output: Write a print statement that announces the reward for one of your habits, using a default value of .experience.

enum RewardType {
    case xp, gold, item
}
var habitRewards = [String: RewardType]()
habitRewards["take out the trash"] = .xp
habitRewards["go for a walk"] = .xp
habitRewards["do 10 pushups"] = .xp

print("Habit logged. You earned 3 \(habitRewards["take out the trash", default: .xp]).")

// The Task: The Party Loot Distribution
// The Enum: Create an enum called ItemCategory with cases for melee, magic, and consumable.
// The Arrays: Create two separate arrays: one called warriorLoot and one called mageLoot, each containing two item names.
// The Dictionary: Create a dictionary called itemLibrary that maps all four items (from both arrays) to their respective ItemType.
// The Set: Create a set called equippedItems containing the names of the items the party has currently equipped.
// The Output: Write a print statement that checks if the first item in the warriorLoot array is equipped (using the set), and another print statement that displays its ItemType from the dictionary (using a default of .consumable).

enum ItemCategory {
    case melee, magic, consumable
}

var warriorLoot = [String]()
warriorLoot.append("axe")
warriorLoot.append("great hammer")

var mageLoot = [String]()
mageLoot.append("sword")
mageLoot.append("staff")

let axe = warriorLoot[0]
let greatHammer = warriorLoot[1]
let sword = mageLoot[0]
let staff = mageLoot[1]

var itemLibrary = [String: ItemCategory]()
itemLibrary[axe] = .melee
itemLibrary[greatHammer] = .melee
itemLibrary[sword] = .melee
itemLibrary[staff] = .magic

var equippedItems = Set<String>([
    axe, greatHammer, sword
])

print(equippedItems.contains(warriorLoot[0]))
print(itemLibrary[axe, default: .consumable])
