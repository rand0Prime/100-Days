import Foundation

// arrays, dictionaries, sets, enums

// an array must contain the same type of data - strings, integers, or doubles only
// add an item to an array with arrayName.append ____
// arrays are created as a variable
// counting items in array starts with 0 - the first item in an array is position 0
// to create an array and define its type without appending any items to begin with, code as var arrayName = Array<type>() where 'type' is replaced by Int, String, or Double
// similarly the array can be created by using 'var arrayName = [Int]()' instead
// assuming the values are the same, values from different arrays can be added as they are simply variables or constants if they have been assigned via the let command
// Arrays are strong when the data inside of it are referencing the same thing - for example, strength scores of an adventuring party's members but is not as good at keeping different types of data organized - strings, integers, doubles, or booleans
// Dictionaries follow a similar syntax as arrays; ex: var char1 = ["Strength: ": 17, "Dexterity: ": 12]
// if there are no set values for these entries, a default can be added when printing
// Sets also allow for you to organize data, so long as there are no duplicates. It will also present the data in random orders each time its printed. These cannot be appended, but you can insert items via setName.insert(itemName)
// Sets are stored incredibly efficiently, and can be quickly used to find something in that set as compared to searching through arrays
// Enums are useful when defining what can be used as possible cases to support; best for items which have a fixed number of attributes (cardinal directions, suits in a deck of cards, etc)

// ex: this code would make available options specifically for the days listed below it
    //enum weekday {
    //case monday, tuesday, wednesday, thursday, friday
    // }


// This code is stream of consciousness as I followed the Day 3 video from https://www.hackingwithswift.com and as such is not organized very nicely... 🙃

var characterNames = ["Bjol", "Korryn", "Macy", "Mavvius", "Indigo"]
print(characterNames [0])

let p1 = characterNames[0]
let p2 = characterNames[1]
let p3 = characterNames[2]
let p4 = characterNames[3]
let p5 = characterNames[4]
print(p1, p2, p3, p4, p5)

characterNames.append("Broccc")
characterNames.append("Gruudak")
let p6 = characterNames[5]
let p7 = characterNames[6]
print(p6)

var strengthScores = Array<Int>()
strengthScores.append(17)
strengthScores.append(13)
strengthScores.append(14)
strengthScores.append(16)
strengthScores.append(13)
strengthScores.append(14)
strengthScores.append(16)
print(strengthScores)

let p1Strength = strengthScores[0]
let p2Strength = strengthScores[1]
let p3Strength = strengthScores[2]
let p4Strength = strengthScores[3]
let p5Strength = strengthScores[4]
let p6Strength = strengthScores[5]
let p7Strength = strengthScores[6]
print(p1Strength, p2Strength, p3Strength, p4Strength, p5Strength, p6Strength)

print("""
    \(p1)'s Strength: \(p1Strength)
    \(p2)'s Strength: \(p2Strength)
    \(p3)'s Strength: \(p3Strength)
    \(p4)'s Strength: \(p4Strength)
    \(p5)'s Strength: \(p5Strength)
    \(p6)'s Strength: \(p6Strength)
    \(p7)'s Strength: \(p7Strength)
    """)

let totalGroupStrength = p1Strength + p2Strength + p3Strength + p4Strength + p5Strength + p6Strength + p7Strength
print("The group's collective strength is \(totalGroupStrength)")
print(characterNames.count)

characterNames.remove(at: 6)
strengthScores.remove(at: 6)
print(characterNames)
print(strengthScores)
print(characterNames.contains("Gruudak"))
characterNames.append("Gruudak")
strengthScores.append(17)
print(characterNames.contains("Gruudak"))
print(characterNames)

var dex = [String: Int]()
dex["Bjol"] = 12
dex["Korryn"] = 14
dex["Macy"] = 15
dex["Mavvius"] = 12
dex["Indigo"] = 19
dex["Broccc"] = 9
dex["Gruudak"] = 10

print(dex)
print(dex.count)

// at this point, the data-by-character is disjointed. I am at peace with that, since this isn't anything I am needing to use and is all just for practice in writing syntax to create variables. I am sure I could fix it, but right now I don't want to. 😅

var players = Set([
 "John",
 "Jacob",
 "Jingle",
 "Himer",
 "Schmidt",
 "Jimmy",
 "Bob"
])

print(players)
players.insert("Ricky")
print(players)

print(players.contains("Bob"))

enum scores {
    case strength, wisdom, intelligence, dexterity, charisma, constitution
}

print(" ")

// PRACTICE PROBLEMS

// Problem 1: The Party Roster
// Concepts: Arrays
// Your adventuring party is growing!
// 1. Create an array called partyMembers containing the names of five different characters.
// 2. Add a sixth member to the party using the append method.
// 3. Print out a message stating how many members are in the party using the .count property.
// 4. Print the name of the character currently in the new last position.

var partyMembers = ["Luthor", "Frazil", "Oneword", "Fever", "Nel"]
let memberNames = "\(partyMembers[0]), \(partyMembers[1]), \(partyMembers[2]), \(partyMembers[3]), and \(partyMembers[4])"
print("The original party included \(partyMembers.count) members: \(memberNames).")

partyMembers.append("Bek")
print("Later, a \(partyMembers.count)th member named \(partyMembers[5]) joined the adventuring party.")

print(" ")

// Problem 2: The Monster Bestiary
// Concepts: Dictionaries
// You need a quick way to look up the hit points (HP) of different monsters.
// Create a dictionary called monsterHP where the keys are monster names (Strings) and the values are their HP (Integers). Include at least three monsters (e.g., "Goblin", "Orc", "Dragon").
// Print the HP of a specific monster from your dictionary.
// A new monster has been spotted! Add a "Troll" with 80 HP to your dictionary.
// The Orc takes some damage. Update its HP to a lower number.

var monsterHP = [
    "Goblin": 15,
    "Orc": 25,
    "Dragon": 300
]

print("The orc's base HP is \(monsterHP["Orc", default: 0])")
monsterHP["Troll"] = 80

var p1Attack = 10

monsterHP["Orc"] = monsterHP["Orc", default: 0] - p1Attack
print("Player 1 attacks the orc for \(p1Attack) damage, leaving it with \(monsterHP["Orc", default: 0]) HP.")

print(" ")

// Problem 3: The Spellbook
// Concepts: Sets
// You are a wizard learning new spells, but you don't want to write the same spell down twice by accident.
// Create a Set called spellbook containing three different spell names.
// Try to insert a spell you already know.
// Insert a brand new spell.
// Print the total number of unique spells in your book.

var spellbook = Set ([
    
    "Fireball",
    "Bigby's Hand",
    "Prestidigitation",
    "Fireball",
    "Fireball",
    "Fireball",
    
])

spellbook.insert("Magic Missile")
print("This grimoire contains \(spellbook.count) unique spells.")

print(" ")

// Problem 4: Character Classes
// Concepts: Enums
// You want to strictly define what kind of class a character can be so you don't make any typos.
// Create an enum called CharacterClass with cases for warrior, mage, rogue, and cleric.
// Create a variable called myClass and assign it to one of your enum cases.
// Change your class to a different one.
// Print your current class

enum characterClass {
    case warrior, mage, rogue, cleric
}

var myClass = characterClass.warrior
myClass = characterClass.rogue

print(myClass)

// The Final Boss: The Guild Roster
// You are managing the roster for your local Adventurer's Guild.
// Your Tasks:
// The Classes (Enum): Create an enum called Role with cases for tank, healer, and damage.
// The Roster (Array): Create an array of four adventurer names.
// The Assignments (Dictionary): Create a dictionary that maps each adventurer's name (String) to their Role (from your enum).
// The Skills (Set): Create a Set of unique skills that your guild currently possesses (e.g., "Stealth", "Lockpicking", "Healing").
// The Printout: Using string interpolation, print a message that introduces one adventurer, their role, and confirms whether the guild has the "Healing" skill.

enum role: String {
    case tank = "tank", healer = "healer", damage = "damage"
}

var roster = ["Luthor", "Bjol", "Dexter", "Frazil"]

var assignments = [
    roster[0]: role.tank,
    roster[1]: role.damage,
    roster[2]: role.damage,
    roster[3]: role.healer
]

var skills = Set([
    "healing",
    "stealth"
])

skills.insert("lockpicking")
let canHeal = skills.contains("healing")

print("This is \(roster[0]). His role is \(role.damage). it is \(canHeal) that the party has a healer. Their healer is \(roster[3]).")

print("\(assignments[roster[1]], default: "0")")

print(" ")

// The Task: The Party Loot System
// The Enum: Create an enum called Rarity with cases for common, uncommon, rare, and legendary.
// The Array: Create an array called foundItems representing a list of loot your party found after completing a big group habit (e.g., "Health Potion", "Iron Sword", "Minor Ring of Warding").
// The Dictionary: Create a dictionary called lootRarities that maps each item in your array to its Rarity.
// The Set: Create a set called claimedLoot containing the names of items that party members have already called dibs on.
// The Output: Write a print statement that checks if the "Magic Ring" is still available (by checking if it is not in the claimedLoot set), and another that prints the rarity of the "Iron Sword" from your dictionary.

enum ItemRarity: String {
    case common, uncommon, rare, legendary
}

var foundItems = ["Lesser Healing Potion", "Iron Sword", "Ring of Minor Warding"]

let lootRarities = [
    "\(foundItems[0])": ItemRarity.common,
    "\(foundItems[1])": ItemRarity.common,
    "\(foundItems[2])": ItemRarity.uncommon
]

var claimedLoot = Set([
    "\(foundItems[0])",
    "\(foundItems[2])"
])

claimedLoot.remove(foundItems[2]) // indicates someone changed their mind and took different loot
claimedLoot.insert(foundItems[1])

print(claimedLoot.contains(foundItems[2]))

print("The \(foundItems[1]) is a \(lootRarities[foundItems[1], default: ItemRarity.rare]) item")
