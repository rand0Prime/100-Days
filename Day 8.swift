import Foundation

// default values for parameters, throwing errors

func printTimesTables(for number: Int, end: Int = 8) {
                      //defines the callsite parameter titles.
                      // if none is entered for end, the default is set to 12
    for i in 1...end {
                // inserts the end callsite parameter into the range
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 2, end: 5)
// prints the times table for 2, up to 2x5
print()

printTimesTables(for: 2)
// prints the times table for 2, up to the default value of 8

print()

enum PasswordError: Error {
    case short, obvious
}

func checkPassword (_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let password = "12345"

do {
    let result = try checkPassword(password)
    print("password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("That's the same combination I have on my luggage! Try a different password please, but that was funny.")
    
} catch {
    print("There was an error.")
}


//Checkpoint 4
// Write a function that accepts an integer from 1 through 10,000
// and returns the integer square root of that number
// - cannot use the built in sqrt() function or similar shortcuts.
// - if the number is less than 1 or greater than 10,000 you should
// throw an "out of bounds" error
// - only consider integer square roots - no decimal/doubles
// if you can't find the square root, throw a "no root" error
















































