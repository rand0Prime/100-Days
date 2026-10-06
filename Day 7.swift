import Foundation

// Functions, accepting parameters, returning data, tuples

// Functions take chunks of code, give them a name, and stores them to be used later

print("Hello there,")
print("thanks for coming!")
print("It's good to have you here.")
// these three lines of code would need to be repeated as-is originally,
// but can be combined into a function to be used more easily

func welcomeMessage() {
    print("Hello there,")
    print("thanks for coming!")
    print("It's good to have you here.")
}
// this stores the same mesage in the welcomeMessage function

welcomeMessage()
// this runs the code within the function welcomeMessage. SO CLEAN!

// the open/closed parentheses can be used to custiomize a function's operation
// ex:

func printTimesTable(number: Int) { // defines a variable to be used in the function's body
    for i in 1...3 { // sets the number of times the function will run
        print("\(i) x \(number) is \(i * number)") // passes 1 - 3 in for i, and number is set when calling function
    } //*** ONCE THE FUNCTION ENDS, ANY DATA INSIDE IT IS DESTROYED. Variables and constants included. Byyyeeeeeeeeee ****
}
printTimesTable(number: 2)

// the code below simulates rolling two d20 dice, storing them in an array
func rollD20AdvantageIncomplete() {
    var d20Rolls = [Int.random(in: 1...20), Int.random(in: 1...20)]
    print("rolls: \(d20Rolls[0]), \(d20Rolls[1])")
    
    if d20Rolls[0] > d20Rolls[1] {
        d20Rolls.remove(at: 1)
    } else {
        d20Rolls.remove(at: 0)
    }
}// however, all the data inside of it is destroyed once the function ends here. Nothing makes it out to the rest of the code

// ****** If something needs to leave the function, we need to tell the function to return data *******
// this is done with -> and the return command
// ex:
func rollD_(number: Int) -> Int { // tells function to spit out an integer after code is done
    return Int.random(in: 1...number) // tells function to use a random number from 1-whatever number I specify when it is run
}

let result = rollD_(number: 12)
print(result)
// assigns d12 roll to result constant and then prints the constant

print(rollD_(number: 12))
// does the same thing as result, but without having to assign integer to result constant

// using the code above for the advantage roll, we can add a return command to make it useful

func rollD20AdvantageComplete() -> Int { // tells function to return an integer
    var d20Rolls = [Int.random(in: 1...20), Int.random(in: 1...20)]
    // creates an array with the two stored random numbers
    print("rolls: \(d20Rolls[0]), \(d20Rolls[1])")
    
    if d20Rolls[0] > d20Rolls[1] { // compares the two dice rolls
        d20Rolls.remove(at: 1) // removes the second value if it is smalller
    } else {
        d20Rolls.remove(at: 0) // removes the first value if it is smaller
    }
    return d20Rolls[0] // spits out the one remaining value of the aerray
}

rollD20AdvantageComplete() // runs the function which includes a print command of the rolls
print(rollD20AdvantageComplete()) // prints only the returned value of the function
// we can copy this code and switch only the > to a < and make the function work as a disadvantage roll!

print()

// Another (cleaner) way to write this code to give the same result:
func rollD20Advantage2() -> Int { // tells function to return an integer
    let roll1 = Int.random(in: 1...20) // simulates a d20 roll
    let roll2 = Int.random(in: 1...20) // simulates a second d20 roll
    return roll1 > roll2 ? roll1 : roll2 // compares both rolls and spits out the higher result
}

print(rollD20Advantage2())
// prints returned result of advantage roll

print()

func letterCheck(word1: String, word2: String) -> Bool {
    return word1.sorted() == word2.sorted()
}

let wordCheck = letterCheck(word1: "cab", word2: "abc")
print(wordCheck)
// this is way 1 of returning the function if a variable is needed for later

print(letterCheck(word1: "cab", word2: "abc"))
// this is way 2 of returning the check if a variable is not needed for later

// TUPLES are a cross between arrays and dictionaries
// they allow for an easier storage of multiple values into a single piece of data
// these can be read at indicies, like arrays, but can store data like dictionaries

func luthorStats() -> (strength: Int, dexterity: Int) {
    (strength: 16, dexterity: 12)
    // creates a tuple with strength and dexterity scores stored
}

var luthorStat = luthorStats()
// creates a variable which allows for calling stats from the tuple created above
print("Luthor's stats: Strength: \(luthorStat.strength), Dexterity: \(luthorStat.dexterity)")

luthorStat.strength += 1
// these are stored in such a way that they can be permanently increased!
print(luthorStat.strength)
// reprinting this after the adding of 1 in the line above prints updated value

print()

//Another shorter way to write this same code:
func frazilStats() -> (strength: Int, dexterity: Int) {
    (12, 16) // Swift knows that these are ints due to the return type listed above
}

var frazilStat = frazilStats()
print(frazilStat.strength)
print(frazilStat.dexterity)
// results print the same way as in luthor's code block!

print()

// if needed, it can be shorted even MORE when creating the original tuple
func onewordStats() -> (Int, Int) { // removes titles from placed data
    (17, 12)
}
var onewordStat = onewordStats()
print(onewordStat.0)
print(onewordStat.1)
// printing will go based off of location in the tuple, just like referencing data in arrays
// for what I am using these for, it will be better to go with the named stats in the block above this one

// can also assign variables or constants to tuple values directly
let luthorStrength = luthorStat.strength
let onewordDexterity = onewordStat.1
print("\(luthorStrength) = \(luthorStat.strength) = \(luthorStat.0)")

// even FURTHER shorthand... though I don't know that I would want to use something with as little description as this:
let (luthorStrength2, luthorDexterity2) = luthorStats()

print()

// this is a revisit for a problem solved on day 6 -
// //Fight a goblin with a 4-person party, going through rounds to attack the goblin until it is defeated.

func d20Roll() -> Int {
    return Int.random(in: 1...20)
}
// sets up a repeatable d20 roll

func d8Roll() -> Int {
    return Int.random(in: 1...8)
}
// sets up a repeatable d8 roll

let critMsg = "!!!CRITICAL HIT!!! "

let p1Name = "Luthor"
let p2Name = "Frazil"

var goblinHP = 55
var goblinAC = 13

while goblinHP > 0 {
    
    let p1Atk = d20Roll() + 4
    let p2Atk = d20Roll() + 2
    
    var p1Dmg = d8Roll() + 3
    var p2Dmg = d8Roll() + 1
    
    let p1Hit = p1Atk >= goblinAC
    let p2Hit = p2Atk >= goblinAC
    
    if p1Hit == true {
        
        if p1Atk - 4 == 20 {
            
            p1Dmg *= 2
            print(critMsg + "\(p1Name)'s attack of \(p1Atk) hits for \(p1Dmg) damage.")
            goblinHP -= p1Dmg
            
        } else {
            
            goblinHP -= p1Dmg
            print("\(p1Name)'s attack of \(p1Atk) hits for \(p1Dmg) damage.")
            if goblinHP < 1 {
                print("Goblin is defeated!")
                break
                
            }
            
        }
        
    } else {
        
        print("\(p1Name)'s attack of \(p1Atk) misses.")
        
    }
    
    if p2Hit == true {
        
        if p2Atk - 4 == 20 {
            
            p2Dmg *= 2
            print(critMsg + "\(p2Name)'s attack of \(p2Atk) hits for \(p2Dmg) damage.")
            goblinHP -= p1Dmg
            
        } else {
            
            goblinHP -= p2Dmg
            print("\(p2Name)'s attack of \(p2Atk) hits for \(p2Dmg) damage.")
            if goblinHP < 1 {
                print("Goblin is defeated!")
                break
                
            }
            
        }
        
    } else {
        
        print("\(p2Name)'s attack of \(p2Atk) misses.")
        
    }
    
}

// original code accomplished the fight in 129 lines.
// The refactoring above accomplished it in 120
// when accounting for a 4 player stack by
// doubling the amount of code for the 2-person team.

// I will now try my hand at reducing it even further by
// attempting to make use of loops with for and in

print()

var partyMembers = Array <String>()
partyMembers.append("Luthor")
partyMembers.append("Frazil")
partyMembers.append("Bek")
partyMembers.append("Fever")
// creates a bank of party names

func p1() -> (strength: Int, dexterity: Int, atkMod: Int) {
    
    (4, 11, 4)
    // assigns p1's name and stats
    
}

func p2() -> (strength: Int, dexterity: Int, atkMod: Int) {
    
    (1, 16, 1)
    //asskgns p2's name and stats
}

func p3() -> (strength: Int, dexterity: Int, atkMod: Int) {
    
    (2, 10, 2)
    // assigns p3's name and stats
}

func p4() -> (strength: Int, dexterity: Int, atkMod: Int) {
    
    (1, 15, 5)
    // assigns p4's name and stats
}

let partyAtkMods = [4, 1, 2, 5]
// lists out attack mods to be added to attack rolls per player

var goblinHP2 = 55
var goblinAC2 = 13
// assigns attack rolls to each player based on their strength modifiers

while goblinHP2 > 0 {
    
    for atkMod in partyAtkMods {
        
        let baseAtkRoll = d20Roll()
        let atkRoll = baseAtkRoll + atkMod
        if baseAtkRoll == 20 {
            
            let dmg = d8Roll() * 2
            print("Attack roll of \(atkRoll) hits for \(dmg) damage.")
            goblinHP2 -= dmg
            goblinHP2 <= 0 ? print("Goblin defeated!") : print("Goblin has \(goblinHP2) HP remaining.")
            if goblinHP2 <= 0 {
                
                break
                
            }
            
        } else if atkRoll >= goblinAC {
            
            goblinHP2 -= d8Roll()
            let dmg = d8Roll()
            print("Attack roll of \(atkRoll) hits for \(dmg) damage.")
            goblinHP2 -= dmg
            goblinHP2 <= 0 ? print("Goblin defeated!") : print("Goblin has \(goblinHP2) HP remaining.")
            if goblinHP2 <= 0 {
                
                break
                
            }
            
        } else {
            
            print("Attack roll of \(atkRoll) misses")
            
        }
    }
}

// this completes combat in 37 LINES!!!!! Need to figure out how to
// get player character names in on the printout next though.
// perhaps I can cwrite a list of functions, update those functions externally,
// and store the functions in the dictionary, then reference the dictionary
// values via keys in loops to pull the updated information to pass through the rounds?

// ----------------------------------------------------------------------------

// Practice problem ⬇️

//The Goal: Create a function that takes a dictionary of party members and their current health, and "buffs" them by adding 10 health to each member.
// ✅ Create a dictionary called partyHealth where the keys are names (Strings) and the values are their current HP (Integers). Add at least three members.
// Write a function called buffParty that accepts one parameter: a dictionary of type [String: Int].
// Inside the function, use a for loop to iterate through the dictionary.
// Print out a message for each member, showing their name, their old health, and their new health (old health + 10).
// Call your function and pass your partyHealth dictionary into it.

var partyHealth:[String: Int] = Dictionary()
partyHealth["Mavvius"] = 32
partyHealth["Indigo"] = 25
partyHealth["Bjol"] = 28
// I think I prefer this methodology for creating a dictionary;
// it is easier to read what it is doing & storing, as well
// as to understand with the separate lines per entry

func buffParty(partyHealth: [String: Int]) {
    // this header line creates the function and
    // the info in the parentheses of the function
    // calls partyHealth as 'party',
    // calls the party member name within PartyHealth
    // as "String", and then the health score as 'Int'

    for (name, oldHealth) in partyHealth {
    // ties parameters of 'name' to the value of
    // the first value of the key of the dictionary -
    // which will be the party member name -
    // and 'oldHealth' to the value tied to that key

   let newHealth = oldHealth + 10
    // makes a new parameter to be used inside the function
        print("\(name) had \(oldHealth) HP, buff has increased it to \(newHealth) HP.")
        // calls all paramters into the print command and
        // passes all variables from outside into the function
    }
}

buffParty(partyHealth: ["Bjol" : 28])
// runs the function, using "Bjol" as 'name' and 28 as 'oldHealth'

// Another sample problem

// Your party just defeated a boss and found a treasure chest! You need to distribute the gold evenly.
// The Dictionary: Create a dictionary called partyGold where the keys are your party members' names (Strings) and the values are their current gold totals (Integers). Add at least three members.
// The Function: Write a function called distributeLoot that accepts two parameters:
// A dictionary of type [String: Int] (the party).
// An Int (the amount of gold each person receives).
// The Loop: Inside the function, use a for loop to iterate through the dictionary.
// The Output: Print out a message for each member showing their name, their old gold total, and their new gold total.
// The Call: Call your function, passing in your partyGold dictionary and a number like 50 for the gold amount.

var partyGold = [String: Int]()
partyGold["Bjol"] = 4
partyGold["OneWord"] = 4
partyGold["Fever"] = 4
partyGold["Frazil"] = 4
// assigns dictionary values to partyGold

func giveGold(name: String, amount: Int) {
    // assigns callsite variables (asks for input)
 
    let oldGold = partyGold["\(name)", default: 0]
    // apsses external parapeter from dictionaryinto the function at "name"
    // and assigns the paramter value to the temporary constant oldGold
    
    let newGold = oldGold + amount
    // calculates gold addition inside the function only, not to the dictionary
    
    print("\(name) had \(oldGold) gold, received \(amount), and now has \(newGold).")
    // prints the actions of what happened in the function
}

giveGold(name: "OneWord", amount: 25)
