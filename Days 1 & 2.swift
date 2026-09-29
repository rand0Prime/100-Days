import Foundation

// variables storage
var greeting = "You've got this!"
var strength = 14
var counter = 10
var number = 2 + 13

//constants storage
let playerName = "Gunther"
let doubleScore = strength * 2
let smartCygnus = true
let fatSage = false
let firstPart = "Gunther is "
let secondPart = "learning how to code"
let scoreCounting = " has a strength score of \(strength)"

counter += 2

print(counter)
print(number)
print(number.isMultiple(of: 5))
print("Cygnus is smart: \(smartCygnus)")
print("Sage is fat: \(fatSage)")
print(firstPart + secondPart)


print(playerName + scoreCounting)

print("""
    
    ----------
    
    Checkpoint 1 assignment:
    convert 10ºC into ºF by multiplying by 9/5 and print it out
    
    """)

// below is the code for checkpoint 1

let degreeC = (10.0)
let degreeF = (degreeC * 9.0 / 5.0 + 32.0)
let equationText = "\(degreeC)ºC is equal to \(degreeF)ºF"

print(equationText)
print(" ")

// below this line are three additional practice problems

// Problem 1: The Character Sheet
// Concepts: Variables, Constants, and Strings

// 1. Create a constant for your character's name.
// 2. Create a variable for your character's current level (start at 1).
// 3. Create a variable for your character's current experience points (start at 0).
// 4. Print a sentence that introduces your character, their level, and their XP using string interpolation.

//constants
let charName = "Kode"
let nextLevelUp = 300
let combatXP = 56


//variables
var charLevel = 1
var currentExp = 234
var xpNeeded = nextLevelUp - currentExp - combatXP

print("\(charName) enters the world at level \(charLevel) with \(currentExp) xp towards their next level-up. After a combat worth \(combatXP) xp, they are \(xpNeeded) xp away from level \(charLevel + 1).")

print(" ")

//Problem 2: The Dice Roller
//Concepts: Integers and Basic Math

//Let's simulate a simple dice roll with a modifier.
//1. Create a constant for a base dice roll (pick a number between 1 and 20).
//2. Create a constant for your character's Strength modifier (e.g., +3).
//3. Calculate the total by adding the roll and the modifier together.
//4. Print the result in a sentence like: "You rolled a 14 + 3 for a total of 17!"

let armorClass = 17
let baseDiceRoll = 16
let strengthMod = 3
let totalRoll = baseDiceRoll + strengthMod

print("After adding your strength modifier to your roll, your \(totalRoll) beats their \(armorClass)... How do you want to do this?")

print(" ")

// Problem 3: The Tavern Bill
//Concepts: Doubles and Booleans

//You and your party are staying at a tavern.
//Create a constant for the cost of a room for the night (use a decimal, like 15.50).
//Create a constant for the cost of a meal (e.g., 5.25).
//Calculate the total cost for one night and one meal.
//Create a boolean variable called hasEnoughGold and set it to true or false depending on whether you think you can afford it.
//Print the total bill and whether you can pay.



let roomFee = 5.50
let mealCost = 1.25
let totalCost = roomFee + mealCost

var partyGold = 19.00
let hasEnoughGold = true


print("The inn keeper asks for you to pay for the room up front, so you take \(roomFee) gold from your pocket and reluctantly slide it across the bar. Your meal so far is up to \(mealCost) gold. Would you like to order anything to drink to wash away the disappointment? You started the night with \(partyGold) and after this evening you'll have \(partyGold - totalCost). ")

partyGold -= totalCost //party gold is updated after the transactions occur
print("You now have \(partyGold) gold remaining." )

print(" ")

// The Final Boss: The Dragon's Hoard & Level Up

// You and your party have defeated the dragon, collected the loot, and gained enough experience to level up!
// Your Tasks:

// 1. The Party & Loot: Create a constant for your party size (e.g., 4) and a constant for the total gold found (e.g., 1050.75). Calculate each person's share.
// 2. The Level Up: Create a variable for your character's current Dexterity stat (e.g., 14).
// 3. The Stat Increase: Use the += operator to permanently add 1 point to your Dexterity.
// 4. The Magic Buff: Create a variable for your character's current Health (e.g., 30). Use the *= operator to multiply your health by 1.5 (representing a temporary buff from a magic spell).
// 5. The Printout: Using string interpolation, print a final message that includes:
// 6. The gold each person gets.
// 7. Your new permanent Strength score.
// 8. Your new buffed Health total.

let partySize = 5
let goldReward = 844.0
let payout = goldReward / Double(partySize)
var dex = 17
var hp = 35.0

dex += 2
hp *= 1.2

print("""
Level up! Dexterity score increased to \(dex). 
Temporary max HP increased to \(hp).
Received \(payout) gold.
""")
