import Foundation

// variable repository
var greeting = "You've got this!"
var strength = 14
var counter = 10
var number = 2 + 13

//constant repository
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
