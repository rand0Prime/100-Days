import Foundation

// loops, while, break, continue

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for item in platforms { // here, item gets created as a variable to pass into the loop body to iterate each data stored in the array 'platforms'.
                        // I could use any word instead of 'item', so long as I call it in the loop body as it is created here.
    print("Swift works great on \(item).")
}

for i in 1...5 { // this sets a range for the loop to move through, in this case i will loop through as 1, 2, 3, 4, 5
                // this will print a separate line of readout for each loop iteration 1-5
    print("5 x \(i) is \(5 * i)")
}

for i in 1...3 {
    print ("The \(i) times table") // prints a header text for a times table matching i through the range 1-3
    
    for j in 1...3 { // calls for the loop iteration of 1-3 to perform the task below
        print("  \(j) * \(i) is \(j * i)") //performs the calculations matching the number from header text
    }
}

for i in 1...3 {
    print ("Counting through 3: \(i)") // calls the number of loop iterations specified
}
print()

for i in 1..<3 {
    // using < here tells to count up to a certain point - useful for arrays since they start counting
    // at 0 - this will prevent arrays counting past their stored placements
    print ("Counting up to 3: \(i)") // calls the number of loop iterations specified
}

let partyMembers = ["Frazil", "Luthor", "Bek", "Fever"]

for partyMember in partyMembers {
    // typing partyMember (without the s) for this line will prompt Ccode to auto-create the loop body!
    print(" \(partyMember) is a member of The Deputies")
    // loops the print line for each member in the array
}

print()

print(partyMembers[1])
    // this will print the 2nd position in the array partyMembers
print(partyMembers[0...2])
    // this will print the first 3 positions
print(partyMembers[0...])
    // this will print all of the positions
print(partyMembers[1...])
    // this will print from positoon 2 through the end of the array
print(partyMembers[0...])
    // this will print all positions, but could be shortened to print(partyMembers)

let count = 1...3
for _ in count {
// these two lines assign a range to a constant, and then for each item in the range it will print
    print("I am one with The Force, and The Force is with me.")
}

print()

var countdown = 3

while countdown > 0 {
    // the while command will trigger a loop to continue until a condition is no longer true
    print("\(countdown)...")
    // this will print a line with the current countdown value
    countdown -= 1
}   // reduces the var countdown value by 1 for each successful loop

print("Time's up!")
print()

//THIS IS WHERE WE CAN CREATE OUR DICE... introducing RANDOM NUMBER GENERATORS!


var luthorD20 = 0
    // establishes variable for Luthor's current d20 roll

while luthorD20 != 20 {
    luthorD20 = Int.random(in: 1...20)
    print("Luthor rolls a \(luthorD20), try again!")
  // if Luthor's roll is not a 20, a line of code will print and the roll will occur again
}

print("after many misses, Luthor lands a critical hit!")
print()


var encounterCombatants = ["Orc", "Goblin Commander", "Warg", "Orc"]

for encounterCombatant in encounterCombatants {
    if encounterCombatant.hasPrefix("O") != true {
        continue
        // selects only certain items that beging with O in the array to continue forward with the printed message below
    }
    print("The \(encounterCombatant) charges forward!")
} // references the string from the array and adds it into the print message

print()

let number1 = 3
let number2 = 18
var multiples = [Int]()
// creates an empty array of type integer

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        // if a number is a multiple of 3 and 18, it is added to the array multiples
        
        if multiples.count == 10 {
            break}
        // once the array contains 10 items, the loop discontinues
        }
    }

print(multiples)
// prints the values stored in the array


//The FizzBuzz problem
for i in 1...100 {
    
    if !i.isMultiple(of: 3) && !i.isMultiple(of: 5) {
        print("\(i)")
    }
    
    else if i.isMultiple(of: 3) {
        print("\(i): Fizz")
    }
    
    else if i.isMultiple(of: 5) {
        print("\(i): Buzz")
    }
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("\(i): FizzBuzz")
        
    }
}

print()

//Fight a goblin with a 4-person party, going through rounds to attack the goblin until it is defeated.

var p1StrengthMod = 1
var p2StrengthMod = 2
var p3StrengthMod = 0
var p4StrengthMod = 1
// assigns strength modifiers to characters; could also assign another variable to these values instead of direct integers

var p1DmgMod = 1
var p2DmgMod = 2
var p3DmgMod = 0
var p4DmgMod = 1
// assigns damage modifiers based on weapon damage bonus.

let goblinAC = 14
var goblinHP = 55
// establishes the goblin variable

let critMsg = "!!CRITICAL HIT!! "

while goblinHP > 0 {
   
    
    let p1Atk = Int.random(in: 1...20) + p1StrengthMod
    let p2Atk = Int.random(in: 1...20) + p2StrengthMod
    let p3Atk = Int.random(in: 1...20) + p3StrengthMod
    let p4Atk = Int.random(in: 1...20) + p4StrengthMod
    // creates randomized attack rolls which will refresh each round
    
    let p1Hit = p1Atk > goblinAC
    let p2Hit = p2Atk > goblinAC
    let p3Hit = p3Atk > goblinAC
    let p4Hit = p4Atk > goblinAC
    // checks to see if it is true that the attack roll of each player exceeds goblinAC
    
    if p1Hit {
        var p1Dmg = Int.random(in: 1...8) + p1DmgMod // d8 damage roll
        if p1Atk - p1StrengthMod == 20 { // checks for a nat-20 attack roll
            p1Dmg *= 2 // if nat-20 attack roll, then double damage
            print(critMsg) // celebrates crit hit
        }
        print("\(partyMembers[0])'s roll of \(p1Atk) hits for \(p1Dmg).")
        goblinHP -= p1Dmg // reduces goblin's health by damage amount
        if goblinHP < 1 {
            print("Goblin defeated!")
            break
        }
        
    } // end of p1Hit check block
   
    else {
        print("\(partyMembers[0])'s attack misses.") // displays message on miss
    }
   
    if p2Hit {
        var p2Dmg = Int.random(in: 1...8) + p2DmgMod
        if p2Atk - p2StrengthMod == 20 {
            p2Dmg *= 2
            print(critMsg)
        }
        print("\(partyMembers[1])'s roll of \(p2Atk) hits for \(p2Dmg).")
        goblinHP -= p2Dmg
        if goblinHP < 1 {
            print("Goblin defeated!")
            break
        }
        
    } // end of p2Hit check block
    
    else {
        print("\(partyMembers[1])'s attack misses.")
    }
   
    if p3Hit {
        var p3Dmg = Int.random(in: 1...8) + p3DmgMod
        if p3Atk - p3StrengthMod == 20 {
            p3Dmg *= 2
            print(critMsg)
        }
        print("\(partyMembers[2])'s roll of \(p3Atk) hits for \(p3Dmg).")
        goblinHP -= p3Dmg
        if goblinHP < 1 {
            print("Goblin defeated!")
            break
        }
        
    } // end of p3Hit check block
   
    else {
        print("\(partyMembers[2])'s attack misses.")
    }
   
    if p4Hit {
        var p4Dmg = Int.random(in: 1...8) + p4DmgMod
        if p4Atk - p4StrengthMod == 20 {
            p4Dmg *= 2
            print(critMsg)
        }
        print("\(partyMembers[3])'s roll of \(p4Atk) hits for \(p4Dmg).")
        goblinHP -= p4Dmg
        if goblinHP < 1 {
            print("Goblin defeated!")
            break
        }
        
    } // end of p4Hit check block
   
    else {
        print("\(partyMembers[3])'s attack misses.")
    }
} // end of goblinHP while loop

