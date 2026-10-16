import Foundation

//practice with closures: .map, .filter, .sorted

//PROBLEM 1: THE BASIC BATTLE CRY

//Goal: Write a closure that takes no parameters and returns nothing.
//Create a constant called battleCry and assign it a closure.
//Inside the closure, simply print "For the Alliance!" (or your faction of choice).
//Call the closure just like you would a function: battleCry().

let battleCry = { () -> Void in
    // creates a constant battleCry and tells it to accept no external
    // parameters and return nothing.
    print("For the alliance!")
    // simply prints this whenever it is run.
}

battleCry()
print()

//PROBLEM 2: THE DICE ROLLER

//Goal: Write a closure that takes no parameters but returns an Int.
//Create a constant called rollD20 and assign it a closure.
//The closure should return a random number between 1 and 20.
//Call the closure and print the result. Hint: Don't forget the -> Int in syntax!

let rollD20 = { () -> Int in
    // assigns constant rollD20 as a closure
    return Int.random(in: 1...20)
}   // closure processes a random number between 1 and 20, then assigns that value to
    // show when the closure is called

print("You rolled a \(rollD20())")
print()

//PROBLEM 3: THE DAMAGE CALCULATOR

//Goal: Write a closure that takes a parameter and returns a value.
//Create a constant called calculateDamage that accepts an Int (the modifier) and returns an Int.
//Inside the closure, return 8 + modifier.
//Call the closure, passing in 3 as the modifier, and print the result.

let calculateDamage = { (modifier: Int) -> Int in
    // creates constant calculateDamage as a closure which will pass int
    // an integer from the callsite when the function is run
    return 8 + modifier
    // will calculate 8 + the integer that is entered at the callsite
}

print(calculateDamage(3))
// runs the calculateDamage closure of 8 + 3, then prints it
print()

//PROBLEM 3: THE ATTACK ROLL

//Goal: Write a closure that accepts two parameters and returns a Bool.
//Create a constant called checkHit that accepts an Int (the roll) and an Int (the armor class).
//The closure should return true if the roll is greater than or equal to the armor class, and false otherwise.
//Call the closure with a roll of 15 and an armor class of 14, and print the result.

let checkHit = { (roll: Int, AC: Int) -> Bool in
    // creates constant checkHit which asks for two inputs at the callsite
    return roll >= AC ? true : false
    // returns true if the first number entered at the callsite is
    // greater than the second number entered at the callsite
}
print(checkHit(15, 14))
// runs the closure with 15 as the first parameter and 14 as the second parameter
// and returns true/false depending on the result
print()

//PROBLEM 4: THE PARTY FILTER

//Goal: Use a built-in Swift method that accepts a closure.
//Create an array of integers called damageRolls with the values [5, 12, 18, 3, 22, 9].
//Use the .filter method on your array to find all rolls greater than 10.
//Hint: The syntax looks like this: let highRolls = damageRolls.filter { roll in ... }
//Print your new highRolls array.

var damageRolls = [5, 12, 18, 3, 22, 9]

let damageRollsAbove10 = damageRolls.filter {$0 > 10}
// creates a new constant array of rolls above 10 from damageRolls array
// using $0 as a placeholder for "for each item in the array"
print(damageRollsAbove10)
// prints the new array
print(damageRolls.filter {$0 > 10})
// also prints the rolls above 10 without creating a new constant!
print()


//PROBLEM 5: THE SHORTHAND ROLL
//
//Goal: Use shorthand parameter names ($0) to make a closure even shorter.
//Create an array of integers called attackRolls with the values [12, 5, 18, 9, 20].
//Use the .filter method to find all rolls that are 15 or higher.
//Challenge: Instead of writing roll in roll >= 15, try using $0 >= 15.
//Print the results.

let attackRolls = [12, 5, 18, 9, 20]
// creates array of integers
print(attackRolls.filter {$0 >= 15})
// prints an array of integers from attackRolls that are >= 15
print()

//PROBLEM 6: THE DAMAGE MULTIPLIER

//Goal: Use the .map method to transform data in an array.
//Create an array of integers called baseDamage with the values [4, 6, 8, 10].
//Use the .map method to double every value in the array (simulating a critical hit!).
//Hint: .map works just like .filter, but it returns a new array with the transformed values.
//Print the new array of doubled damage.

let baseDamage = [4, 6, 8, 10]
// creates array of integers
print(baseDamage)

let critDamage = baseDamage.map {$0 * 2}
// creates a new array which multiplies each element by 2
print(critDamage)
print()

//PROBLEM 7: THE CRITICAL HIT FILTER

//Goal: Combine .filter and .map.
//Create an array of integers called combatRolls with the values [8, 15, 20, 12, 20, 4].
//Use .filter to keep only the rolls that are exactly 20.
//Use .map on the result to turn those 20s into a string that says "Critical Hit!".
//Print the final array of strings.

let combatRolls = [8, 15, 20, 12, 20, 4]
// creates array of integers
let criticalHitMessages = {combatRolls.filter {$0 == 20}.map {_ in "Critical hit!"}}()
// creates new array of integers which
// only includes items that are equal to exactly 20
// and takes each one of those results and transforms it
// into a string that says "Critical hit!" and adds it to the new array.
print(criticalHitMessages)
//prints the array of strings

//PROBLEM 8: THE PARTY SORTER

//Goal: Use the .sorted method with a closure.
//Create an array of strings called partyMembers with the values ["Luthor", "Frazil", "Bek", "OneWord"].
//Use the .sorted method to sort the names by their length (shortest to longest).
//Hint: The closure for .sorted takes two items (e.g., $0 and $1) and returns a Bool. You can compare their lengths using .count.
//Print the sorted array.

let partyMembers = ["Luthor", "Frazil", "Bek", "OneWord"]
// creates an array of strings

let partyMembersSorted = partyMembers.sorted { name1, name2 in
    // sets up expected parameters for inside the body of the closure
    if name1.count < name2.count {
        // checks to see if name1 is shorter than name2
        return true
        // if it is shorter, then it stays put
    } else {
        return false
        // if it is longer, then it moves to the right in the array
    }
}
print(partyMembersSorted)
// prints the new sorted array of strings
print()


//PROBLEM 9: THE CRITICAL HIT LOG

//You have a list of attack rolls from your latest combat session, and you want to pull out only the best ones to celebrate.
//The Data: Create an array of integers called attackRolls with the values [12, 5, 20, 18, 9, 20, 14].
//The Chain: Using method chaining (no temporary variables!), do the following:
//Filter the array to keep only the rolls that are 20.
//Map those rolls into a string that says "Critical Hit! (Natural 20)".
//The Output: Use a for loop to print each string in your final array.

let atkRolls = [12, 5, 20, 19, 9, 20, 14]
// sets up the array

let bestOfAtkRolls = atkRolls.filter {$0 == 20}.map {"Critical Hit! Natural \($0)"}
// creates the new array, filters the 20s to be what is left, and maps them to a string.

for item in bestOfAtkRolls {
    print("\(item)")
}
// *** NOTE *** removing the outer curly braces causes the need for () at
// the end of bestOfAtkRolls in order to run the 'for' loop.
print()


//PROBLEM 10: THE INITIATIVE TRACKER
//Concepts: Arrays, Sorting, Closures
//Create an array of tuples called combatOrder, where each tuple contains a
//character's name (String) and their initiative roll (Int). Add four characters with different rolls.
//Use the .sorted() method with a closure to sort the array so the
//character with the highest initiative is first.
//Print the sorted list.

let combatOrder = [
    (name: "Luthor", initiative: 13),
    (name: "Frazil", initiative: 17),
    (name: "Bek", initiative: 11),
    (name: "OneWord", initiative: 9)]
// creates an array of tuples which each have two elements: their name and thair Initiative score.
// The white text descriptors before each tuple element are not necessary, but are useful for calling
// later in code

let sortedInitiative = combatOrder.sorted { $0.1 > $1.1}
// saves a new constant (array of tuples) sorted by the initiative element.
// The .1 references the second element of each tuple, similar to how
// arrays are 0-index-referenced

print(sortedInitiative)
// prints the new sorted array of tuples in total
print(combatOrder[0].initiative)
// prints the second element in the tuple which is position 1 in the array
print()


//PROBLEM 11: THE SPELL SLOT FILTER
//Concepts: Dictionaries, Filtering, Mapping
//Create a dictionary called spellBook where the keys are spell names (Strings)
//and the values are their spell levels (Ints). Add at least five spells ranging from level 1 to 3.
//Use .filter() to find all spells that are level 2 or higher.
//Use .map() on the result to create an array of strings that says "Level [X]: [Spell Name]".
//Print the resulting array.

let spellbook = [
    "Fireball": 3,
    "Magic Missile": 1,
    "Sending": 1,
    "Mass Cure Wounds": 3,
    "Spirit Guardians": 3
]
// creates the dictionary

let spellbookLvl_2 = spellbook.filter { $0.value >= 2}.map {"Level \($0.value): \($0.key)"}

// pulls out all dictionary values that are 2 or higher, and converts them in to
// a string, adding them to a new constant array.

print(spellbook)
print(spellbookLvl_2)

//PROBLEM 12: THE LOOT VALUE CALCULATOR
//Concepts: Arrays, Reduce
//Create an array of integers called lootValues representing the gold value of items you found: [15, 50, 10, 100, 5].
//Use the .reduce() method to calculate the total value of all the loot combined.
//Hint: .reduce(0, +) is a quick way to sum an array of integers!
//Print the total gold value.

let lootValues = [15, 50, 10, 100, 5]
// creates the array

print("Total value of loot: \(lootValues.reduce(0, +)) gold.")
// prints a string which includes the sum of all values in the array lootValues,
// starting from 0. Could also change the + to a - to have it subtract
// the values from a starting value of any integer (which would replace the 0
// in the reduce function
print()


//PROBLEM 13: THE HIGH ROLLERS
//Concepts: Arrays, Filtering
//Create an array of integers called savingThrows with the values [4, 18, 9, 20, 14, 2, 16].
//Use .filter() to keep only the rolls that are 15 or higher.
//Print the filtered array.

let savingThrows = [4, 18, 9, 20, 14, 2, 16]

print(savingThrows.filter {$0 > 15})
print()

//PROBLEM 14: THE SPELL SLOT EXPANDER
//Concepts: Arrays, Mapping
//Create an array of integers called spellLevels with the values [1, 2, 3, 4].
//Use .map() to double each value (representing a magical buff that doubles your spell slots).
//Print the new array.

let spellLevels = [1, 2, 3, 4]
let buffedSpellLevels = spellLevels.map {$0 * 2}.map {$0 * 2}
print(buffedSpellLevels)
print()

//PROBLEM 15: THE PARTY ROSTER
//Concepts: Dictionaries, Mapping
//Create a dictionary called partyClasses where the keys are names and the values
//are their classes (e.g., ["Luthor": "Cleric", "Frazil": "Wizard"]).
//Use .map() to create an array of strings that reads "[Name] the [Class]".
//Print the resulting array.

let partyClasses = [
    "Luthor": "Cleric",
    "Frazil": "Wizard"
]

let partyRoles = {partyClasses.map {"\($0.0) the \($0.1)"}}
print(partyRoles())

//PROBLEM 16: THE TOTAL XP
//Concepts: Arrays, Reducing
//Create an array of integers called encounterXP with the values [150, 300, 100, 450].
//Use .reduce() to calculate the total XP earned from all encounters.
//Print the total.

let encounterXP = [15, 300, 100, 540]
print(encounterXP.reduce(0, +))
print()

//PROBLEM 17: THE ALPHABETICAL INVENTORY
//Concepts: Arrays, Sorting
//Create an array of strings called inventory with
//the values ["Potion", "Sword", "Shield", "Arrow", "Map"].
//Use .sorted() to sort the items alphabetically.
//Print the sorted inventory.

var inventoryRaw = [
    "Potion",
    "Sword",
    "Shield",
    "Arrow",
    "Map",
    "Bow",
    "Chainmail"
]

var inventory = inventoryRaw.sorted()

print(inventoryRaw)
print(inventory)

//The Boss Encounter
// You party just defeated a boss and its minions. You
// need to calculate the total XP earned, but only from
// the monsters that were actually defeated.
// 1. Create an array of tuples representing the ehcounter.
// Each tuple should contain a monster name (string), its XP value (Int),
// and a boolean indicating if it was defeated.
// 2. Using method chaining, do the following:
// - filter the array to keep only the monsters where defeated is true
// - map the remaining monsters to extract just their XP totals
// - Reduce the XP values to get a single total
// 3. Print the total XP earned from the encounter

let encounterEnemies = [
    (name: "Goblin", xp: 50, defeated: true),
    (name: "Orc", xp: 100, defeated: true),
    (name: "Dragon", xp: 5000, defeated: false),
    (name: "Kobold", xp: 25, defeated: true)
]
// creates an array of tuples

print(encounterEnemies.filter { $0.defeated == true}.map {$0.xp}.reduce(0, +))
print()

// prints the XP from defeated enemies:
// $0.defeated == true considers only defeated enemies,
// passes that group to the map command which references
// the xp element of the tuples with .map {$0.xp},
// and .reduce(0, +) starts the sum from 0 and adds
// the values together.


//The Post-Combat Summary
//Your party has just finished a massive battle.
// You need to process the results to figure out
// who gets what, and how much total XP was earned.
//The Data: Create an array of tuples representing
// the enemies your party faced. Each tuple should
// contain the enemy's name (String), their XP
// value (Int), their loot value in gold (Int),
// and a boolean indicating if they were defeated.

//Using method chaining, do the following:
//Filter the array to keep only the enemies that
//were defeated.
//Sort the remaining enemies by their XP value in
//descending order (highest XP first).
//Map the sorted enemies into a string that reads:
//"[Name] - [XP] XP & [Gold] Gold".
//The Output: Print each string in the final array.
//The Bonus: In a separate line of code, calculate the
//total gold earned from the defeated enemies using .reduce().

let encounterResults = [
    (name: "Goblin Boss", xp: 200, gold: 50, defeated: true),
    (name: "Orc Shaman", xp: 150, gold: 30, defeated: true),
    (name: "Troll", xp: 100, gold: 100, defeated: false),
    (name: "Goblin Minion 1", xp: 50, gold: 5, defeated: true),
    (name: "Goblin Minion 2", xp: 50, gold: 5, defeated: true),
]
// makes the array of tuples to start with

let defeatedCombatants = encounterResults.filter {$0.defeated == true}.sorted {$0.xp > $1.xp}.map {"\($0.name) - \($0.xp) XP & \($0.gold) Gold."}
// creates new array, checking each item in previous
// array to see if defeated is true, then sorts them
// by highest experience first, then uses .map to change
// the values into strings.

for combatant in defeatedCombatants {
    print(combatant)
    // prints each item in the new array on a separate line
}

print("Total gold earned from encounter: \(encounterResults.filter {$0.defeated == true}.map {$0.gold}.reduce(0, +))")
// prints the total amount of gold from all defeated enemies


