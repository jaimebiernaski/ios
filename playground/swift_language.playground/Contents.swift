/* ***********
    SWIFT
************ */

var variable = "This may changes over time"
let constant = "This does not change over time"

// Data types
var string = "asdf" //String
var integer = 1 //Int
var float = 2.3 //Float
var double = 3.1415926 //Double
var boolean = true // Bool

var array = [1,2,3]
var dictionary = [ "name": "John" ]

// String interpolation
var a = 2
var b = 3
//print("Hello World! \(a) + \(b) = \(a+b)")

// Array
var numbers = [1,2,3,4]
numbers.count
numbers[3]

// Random <DataType>.random
var x = numbers.randomElement()
var y = numbers[Int.random(in: 0...numbers.count-1)]
var z = numbers[Int.random(in: 0..<numbers.count)]
var w = numbers.shuffled()

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var password = ""
for _ in 0...5 {
    password += alphabet[Int.random(in: 0..<alphabet.count)];
}

//print(password)


// Functions
var name:String = "Bob";

func greetings () {
//    print("Hello")
}

func greetings2 (name: String) {
//    print("Hello \(name)")
}

func greetings3() -> String {
    return "Hello World"
}

//print(greetings3())


for _ in 0...1 {
    greetings2(name: name)
}
    
var f = 3.4


// IF, ELSE & SWITCH

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore > 80 {
//        print("You love each other like Kanyes loves Kanye")
    } else if loveScore > 40 {
//        print ("You go together like Coke and Mentos")
    } else {
//        print ("You will be forever alone")
    }
//    print(loveScore)
}

loveCalculator()
 

func loveCalculator2() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 80...100:
        print("You love each other like Kanyes loves Kanye")
    case 40..<80:
        print ("You go together like Coke and Mentos")
    case ...40:
        print ("You will be forever alone")
    default:
        print ("Impossible, out or range")
    }
    print(loveScore)
}

//loveCalculator2()




//OPTIONALS !? > Safety check

//var player1Username: String =  nil << Warning
var player1Username: String? =  nil
player1Username = "Jack"
//print(player1Username)


let studentsAndscores = ["Amy": 88, "James": 55, "Helen": 99]
var highScore: Int? = nil
studentsAndscores.forEach { (key: String, value: Int) in
    if highScore == nil || value > highScore! {
        highScore = value
    }
}
//print("High Score is \(highScore!)")





// STRUCTS
// on copy, structs passes VALUE (real copy)
//print("STRUCTS")

struct Town {
    let name: String
    var citizens: [String]
    var resources: [String:Int]
    var defense: Int
    
    init(name:String, citizens:[String], resources:[String:Int], defense: Int){
        self.name = name
        self.citizens = citizens
        self.resources = resources
        self.defense = defense
    }
    
    mutating func fortify() {
        print("Defenses increased")
        defense += 10
    }
}

var letterTown = Town(name: "Letters Town", citizens: ["A","B"], resources: ["Math": 10], defense: 80)
var numberTown = Town(name: "Numbers Town", citizens: ["1","2"], resources: ["Math": 100], defense: 50)

//print(letterTown)
numberTown.citizens.append("3")
//print(numberTown)

//CLASSES
// on copy, classes passes REFERENCE (point to same object)

print("CLASSES")
class Enemy {
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func move() {
        print("Walk fowards")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
    
    func takeDamage(amount: Int){
        health -= amount
    }
}


class Dragon: Enemy { //inheritance
    var wingSpan = 2
    func talk(speech:String) {
        print("Says: \(speech)")
        
    }
    override func move() { //replace func behaviour
        print("Fly fowards")
    }
    
    override func attack() {
        super.attack() //trigger attack frmo supeprclass
        print("Spits fires, does 10 damage")
    }
}


let skeleton = Enemy(health: 100, attackStrength: 10)
print("Skeleton Health:",skeleton.health)
skeleton.attack()
skeleton.move()

let dragon = Dragon(health: 100, attackStrength: 15)
print("Dragon Health:", dragon.health)
dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane")
dragon.wingSpan = 50
dragon.attackStrength = 15
dragon.move()
dragon.attack()


/*
 https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes
 
 Choosing Between Structures and Classes
 Decide how to store data and model behavior.

 Structures and classes are good choices for storing data and modeling behavior in your apps,
 but their similarities can make it difficult to choose one over the other.

 Consider the following recommendations to help choose which option makes sense when adding a new data type to your app.

  - Use structures by default.

  - Use classes when you need Objective-C interoperability.

  - Use classes when you need to control the identity of the data you're modeling.

  - Use structures along with protocols to adopt behavior by sharing implementations.
 
 STRUCTS
    - are immutable
    - passes by VALUE
 
 CLASSES
    - passes by REFERENCE
    - Inhreritance
 
 more details at: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
 
 */

//OPTIONAL Deep Diving

let optional: String? = nil
let defaultValue = "asdf"

// 1) Force Unwrapping
var text:String = optional!

// 2) Check for nil value
if optional != nil {
    text = optional!
}

// 3) Optional Binding
if let safeOptional = optional {
    text = safeOptional
}

// 4) Nil Coalescing Operator
text = optional ?? defaultValue

// 5 Optinal Chaining
struct OptionalStruct {
   var property = 123
    func method(){
        print("Im a struct")
    }
}

var optionalStruct: OptionalStruct?

optionalStruct = nil
optionalStruct?.property
optionalStruct?.method()

optionalStruct = OptionalStruct()
optionalStruct?.method()



