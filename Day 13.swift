import Foundation

//Day 13: Protocols and extensions, opaque return types

//protocols make sure our types follow rules and let us defince properties and methods
//that we want to use in our code. They are like a blueprint for how
//things ought to look insude of a given type

protocol Vehicle {
    var name: String { get }
    //creates a property which is read-only for anything requiring conformity to it.
    //Cannot be set to default values since there is no execution of code inside the protocol itself
    var currentPassengers: Int { get set }
    // creates a property which is read/write for anything requiring confirmty to it
    //Cannot be set to default values since there is no execution of code inside the protocol itself

    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    //these methods must be used when using the protocol Vehicle.
    //Note that these methods don't have any code in them; no function bodies allowed
    //inside of protocols!
}

protocol CanBeElectric {
    
}

//From here we can 'adopt' or 'conform to' the protocol by writing code
//that references and uses it. These methods inside the protocol
//are the bare minimum of what must exist when the protocol is adopted
//in future code

struct Car: Vehicle, CanBeElectric {
    //builds like a class inheriting from a parent class
    
    //we cah have items be required to confirm to multiple protocols
    //by separating them with a ,
    
    let name = "Car"
    var currentPassengers = 1
    //***NOTE*** computed properties are also allowed to be in
    //these properties so long as they are following the rules
    //set forth by the protocol.
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }  //fills one required method from inside Vehicle protocol
    
    func travel(distance: Int) {
        print("I'm driving \(distance) miles.")
    } //fills the other required method from inside Vehicle protocol
    
    func openSunroof() {
        print("It's a nice day.")
    } //creates a new unrequired (but allowed!) function inside this struct
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }  //fills one required method from inside Vehicle protocol
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) miles.")
    } //fills the other required method from inside Vehicle protocol
}

func commute(distance: Int, using vehicle: Vehicle) {
    //creates a function expecting 2 parameters: 'distance' is expecting an Int,
    //and 'using' is expecting a parameter which follows the Vehicle protocols
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

//both car and bike conform to protocol Vehicle, and as such process
//the work inside their respective methods correctly.

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    //creates a function expecting two parameters: 'vehicles' which is an array of
    //items following the Vehicle protocol, and 'distance' which is an Int
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        //runs the estimateTime method from whichever vehicle parameter
        //is currently passing from the array through to the for loop
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)
//runs the function with the 'car' and 'bike' constants (which are structs) passing
//through as parameters

//***OPAQUE RETURN TYPES***

func rollD6() -> some Equatable {
    //says the return value will be equatable, but it will be some kind of
    //specific equatable. Swift can see that this one will return an Int
    Int.random(in: 1...6)
}

func getRamdomBool() -> some Equatable {
    Bool.random()
}

//Int and Bool both conform to a protocol of being equatable - this means that
//they are able to be compared by using == in code
//ex: getRandomBumber() == getRandomNumber() - this is either true or false,
//but it can be tested

print(rollD6() == rollD6())

//using the some equatable opaque return type gives us flexibility to
//go back and change the code and have it still run normally without
//having to change a bunch of other code. For example, we could change
//Int.random to be Double.random and the code would still run correctly,
//since the function return value is generically listed as some equatable,
//rather than the specific Int value

//best used when we want to keep our return options open and flexible.

//*****************specifically, using protocol View for layouts and how things are drawn
//on the screen would state that the return value - the screen displaying
//images and buttons - returns 'some View' as its output

//***CREATING AND USING EXTENSIONS***

var quote = "   The truth is rarely pure and never simple   "
//this string has 'white space' - tab, spaces, return, etc - around it.

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
//this removes the white space arount the string, but is a bit wordy to type each time
print(quote)
print(trimmed)

var quote2 = "  Think you know everything and you know nothing instead  "

extension String {
    //we are basically creating a text shortcut here, for type String
    func trimmed() -> String {
        //creates a method within the extension which returns a string
        self.trimmingCharacters(in: .whitespacesAndNewlines)
        //calls for the longer trimming method to be used on the current string instance
    //we cound also add more extensions within this body of code to keep them neatly organized
        
    }
    mutating func trim() {
        self = self.trimmed()
        //this performs the same function that func trimmed() performs, but it instead
        //updates the original variable to be trimmed
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
        //adds a count of strings separated by creation of new lines
    }
}

let trimmed2 = quote2.trimmed()
//calls the extension onto the string quote2

print(quote2)
print(trimmed2)
//trims the quote and stores it as a second variable called trimmed2

quote.trim()
print(quote)
//trims the original quote and re-saves it in the same variable. This updates it without
//needing to make a new constant to save the updated string

//*****NOTE!******
//when making or using extensions in this way, it is important to do the following:
//1. use -ed or -ing when creating a new constant/variable
//2. use the command itself (no -ed or -ing) when these changes are
//being done and updating the variable in place.
//ex: .sort would update a variable array to be sorted, while .sorted would be used
//on a new variable or constant which is making a sorted copy of the original array

let lyrics = """
    Don't stop
    Get it get it
    Then there's more I don't understand
    """

print(lyrics.lines.count)
//calls the String extension 'lines' to the string 'lyrics'

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
    extension Book {
        init(title: String, pageCount: Int) {
            self.title = title
            self.pageCount = pageCount
            self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "LOTR", pageCount: 1178, readingHours: 24)
//of we have custom initializers (inside the Book struct, for example), they do not auto populate
//at the callsite. Ex. reading hours does not show up at the callsite.
//HOWEVER! this does not apply to extensions. if we add an extension for the Book struct, we can
//have both our customer initializer for readingHours as well as have it pop up at the callsite

//******PROTOCOL EXTENSIONS******

//extensions can be added to protocols; works for computed properties as well

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}//creates an extension for Arrays, Sets, and Dictionaries
 //(ALL of them conform to the Collection protocol) data type which can be used by any array.
 //the extension is called isNotEmpty, and is a Bool which says that an array is not empty.

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    //calls the new extension isNotEmpty on the guests array
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}//creates the protocol with minimum required properties for anything conforming to it

extension Person {
    func sayHello() {
        print("Hello, my name is \(name)")
    }
}//creates extension of Person protocol which adds the default func for sayHello
 //that is automatically baked into any new thing which conforms to the rest of
 //Person protocol, in this case that means that the only property needing to be
 //listed now is name

struct Employee: Person {
    let name: String
}//creates a struct which conforms to Person protocol, and has the extension of
 //sayHello implictly written due to the Person extension

let luthor = Employee(name: "Luthor")
luthor.sayHello()

//******CHECKPOINT 8******

//1. make a protocol that describes a building, adding various properties and methods, then
//2. create two structs, House and Office, that conform to it. Your protocol should require the following:

//A property storing how many rooms it has.
//A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
//A property storing the name of the estate agent responsible for selling the building.
//A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agent: String { get }
    func summary()
}

extension Building {
    func summary() {
        print("contains \(rooms) rooms, costs $\(cost). Listing managed by \(agent).")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    }

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    }

let storeOffice = Office(rooms: 2, cost: 125_000, agent: "Mavvius")
storeOffice.summary()

let townHome = House(rooms: 8, cost: 550_000, agent: "Bek")
townHome.summary()
















