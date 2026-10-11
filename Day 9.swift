import Foundation

// Closures, trailing closure syntax, accepting functions as parameters


func playerSetup() {
    print("Welcome!")
}
//creates the function that prints a message

playerSetup()
// runs the function resulting in the printed message
print()

var setupCopy = playerSetup
// creates a variable which contains the playerSetup function
// *** note that the () are removed from the function name ***

setupCopy()
// runs the setupCopy as a function
// *** note the () have returned at the end of the variable name **

// the () at the end of the variable setupCopy or the function playerSetup
// is what tells the function playerSetup to run
print()

// can also code a function diretly as a constant
let pickName: () -> Void = {
    // () -> Void is the type annotation for functions
    print("Please enter your character's name.")
}

pickName()
print()
// writing it in this way has the fancy name of a 'closure expression'

// *** writing it out in this way has a different way of passing parameters
// into the closure expression - directly into the curly braces

let pickName2 = { (name: String) -> String in
    // the parameters look similar to functions, with the addition of 'in' at the end.
    // 'in' serves as a spacer between the parameters of the closure
    // and the beginning of the code inside the body of the closure
    "You've chosen to name your character \(name). Continue?"
}

print(pickName2("Luthor"))
// commands a print of the constant referencing function pickName2 with parameter "Luthor"
print()

func getUserData(for id: Int) -> String {
    // accepts parameters at callsite for integers, and returns the string
    // listed in the if tree
    if id == 1989 {
        return "Luthor"
    } else {
        return "Anonymous"
    }
}

print(getUserData(for: 1989))
print(getUserData(for: 1990))
// the getUserData returns a string printed as determined by the if tree.
// Below is a way to copy this function:

let data: (Int) -> String = getUserData
// creates a constant containing the function of getUserData with parameters
// that match the parameters accepted by the original function
let user = data(1989)
print(user)
print()

let ogParty = ["Luthor", "Frazil", "Bek", "OneWord"]
let ogPartySorted = ogParty.sorted()
// sorts array ogParty alphabetically
print (ogPartySorted)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    // creates a function intended to put the team captain at the
    // front of the sort order, and then sort rest of team alphabetically
    if name1 == "OneWord" {
        return true
    } else if name2 == "Oneword" {
        return false
    }
    return name1 < name2
    // returns a true or false of whether a name is before another alphabetically
}

//The following code would allow for the party to sort with the captain OneWord at the front:

//let captainFirstTeam = ogParty.sorted(by: captainFirstSorted)
//print(captainFirstTeam)
//print()

// *** instead, we can create a closure to cause the same work to occur as the captainFirstSorted function ***

let captainFirstTeam = ogParty.sorted(by: { (name1: String, name2: String) -> Bool in
    // calls sorted function on ogParty, but passes in a closure
    // with '(name1: String, name2: String)' being passed in and
    // a boolean true/false being returned
    if name1 == "OneWord" {
        return true
    } else if name2 == "Oneword" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeam)
print()

// this can be shortend to make the code less cluttered if desired:

let captainFirstTeam2 = ogParty.sorted { name1, name2 in
    // this closure already assumes we are passing in 2 strings
    // so we do not need to include the types in the parameter-in section.
    if name1 == "Frazil" {
        return true
    } else if name2 == "Frazil" {
        return false
    }
    return name1 < name2
}

print(captainFirstTeam2)
print()

// this can be shortened even further to make the code less cluttered,
// though it does lose some of its readability as a result

let captainFirstTeam3 = ogParty.sorted {
    if $0 == "Bek" {
        // $0 refers to the first element in the array, $1 to the second element
        return true
    } else if $1 == "Bek" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam3)
print()

// the shortest shorthand example is better for if our sort is simpler, like
// reversing the order in the array:

let reverseTeam = ogParty.sorted {
    return $0 > $1
    // this reverses the order of the array that the left should come after the right
}

print(reverseTeam)
print()

// even FURTHER reduction can be done since we no longer need the return action
// because our code is down to a single line:

let reverseTeam2 = ogParty.sorted {$0 > $1}
print(reverseTeam2)
print()

let fOnly = ogParty.filter { $0.hasPrefix("F")}
    // creates a closure that tests all elements in the array to see
    // which positions start with F, and then creates a new array
    // with the elements which passed the test
print(fOnly)
print()

// the map function allows for the elements in the array to be transformed
// in some way and creates a new array with these adjustments

let uppercaseTeam = ogParty.map { $0.uppercased() }
print(uppercaseTeam)
print()

// functions can also be accepted as parameters in another function

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    // holy coding, Batman - what am I even looking at? O_o
    // this creates a function called makeArray,
    // and accepts two parameters: size: Int which tells how many
    // elements it will contain. and a generator function as the second parameter.
    // the second parameter it accepts is 'using generator: () -> Int
    // which says "I accept no parameters - represented by the '()' which equals Void -
    // but will return an integer every time I am called."
    // each of these integers will go into the eventual output of the function,
    // which will be an array of integers.
    var numbers = [Int]()
    // inside makeArray, this creates an empty array of integers
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
        // generates a number using the generator function aka second parameter,
        // and adds this number to the array called 'numbers'.
        // the constant newNumber is recycled for each pass through the loop,
        // and is cleared each time before moving on to the next number in the range
        // defined by the 'size' parameter aka the first parameter
    }
    return numbers
}

// a useful example:

let rolls = makeArray(size: 50) {
    //makes a closure which generates an array of 50 elements
    Int.random(in: 1...20)
    // each element of the array will be a random number between 1 and 20
}

print(rolls)
print()

// we could also have said:
func generateNumber() -> Int {
    // creates a function which returns 1 random integet
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
// creates a new array of 50 elements using the generateNumber function above
// to fill the elememts
print(newRolls)
print()

// you can make your function accept multiple functions as parameters:

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    // creates a function which accepts three functions as parameters, all of which accept no parameters
    // and return nothing
    print("About to start first work")
    first()
    print("about to start second work")
    second()
    print("about to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


















































