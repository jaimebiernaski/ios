/* ***********
    SWIFT
************ */

import UIKit

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

//PROTOCOLS



protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }
    
}

class Eagle: Bird, CanFly {
    func soar() {
        print("The eagles glides in the air using air currents.")
    }
    func fly() {
        print("The Eagle flaps its wings and lifts off in the sky.")
    }
}

class Penguin: Bird {
    func swin() {
        print("The penguin paddles throught the water")
    }
}

struct flyingMuseum {
    func flyingDemo (flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
     func fly() {
        print("The airlnae flyes using its engines")
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.swin()

let myPlane = Airplane()

let museum = flyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myPlane)
//museum.flyingDemo(flyingObject: myPenguin)


//PROTOCOLS & DELEGATES

/**
 Protocls defines expexted requirements
 
 Anallogy
 
1 - There is the EMERGENCY CALL HANDLER
    That send message to a BLEP about an emergency event
        In order to be a carry blep , the person must to have complete te ALS - advance life support course,
        to know how to RESUCITATE somebody using methods as CPR.
        The call handler do not care whos is the Blep carrier, because knows, the person adopts the  ADVANCE LIFE SUPPORT  protocol
    
2 - The PARAMEDIC Peter Is on shit to carry the blep
3 - In  a emegercy situation the EmergencyCallHandler sender a message to TRIGGER the  Blep with and information: You must go here and perform the CPR
4 - Peter goes and do that action, and he can do because has the ALS course, what makes he follows the AdvanceLifeSupport protocol
5 - The next person who assumes the Blep, (Paramedic, Doctor, Surgeon) follows the same process, the Call Handler  dont cares whos care the blep
 
 
            
 */

//main.swift
protocol AdvanceLifeSupport {
    func perfomCPR()
}
 
class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.perfomCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func perfomCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvanceLifeSupport {
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func perfomCPR() {
        print("The Doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    
    override func perfomCPR() {
        super.perfomCPR()
        print("Sings stayjbing alive by the BeeGees")
    }
    
    func useEletricDrill() {
        print("Whirr...")
    }

}

//

let emilio = EmergencyCallHandler()
//let peter = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()



// CLOSURES

/**
 Closures are essentially anonimous functions (without a name)
 https://docs.swift.org/swift-book/LanguageGuide/Closures.html
 */

import UIKit

func calcutalor(n1: Int, n2:Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

//(Int, Int) -> Int
func add(n1: Int, n2:Int) -> Int {
    return n1+n2
}

func multiply(n1: Int, n2:Int) -> Int {
    return n1*n2
}



calcutalor(n1: 1, n2: 2, operation: add)
calcutalor(n1: 2, n2: 3, operation: multiply)

func calcutalorWithClosure(n1: Int, n2:Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

/**
 
 // FROM
 func add(n1: Int, n2:Int) -> Int {
     return n1+n2
 }
 // TO
 { (n1: Int, n2:Int) -> Int in
     return n1+n2
 }
 
 */

calcutalorWithClosure(n1: 1, n2: 2, operation: { (n1: Int, n2:Int) -> Int in return n1+n2 })
var result = calcutalorWithClosure(n1: 2, n2: 3, operation: {$0 * $1})
print("1 > ",result)

//With trailling closure
result = calcutalorWithClosure(n1: 3, n2: 4){$0 * $1}
print("2 > ",result)

///////////////////

array = [6,2,3,9,4,1]
func addOne (n: Int) -> Int {
    return n+1
}
array.map(addOne)

let result3 = array.map{$0+1}
print("3 > ",result3)

let result4 = array.map{"\($0)"}
print("4 > ",result4)

// Computed properties
var parameter = 1
var aProperty: String {
    switch parameter {
    case 1:
        return "It is one"
    default:
        return "It diferent of one"
    }
}

print(aProperty)
;

//Paramenter Name
var test = 1
func myFunc (name eman: Int) {
    print(eman)
}
myFunc(name: 1)

//EXTENSIONS

//import UIKit

//extension Double {
//    func round(to places: Int) -> Double{
//        let precisionNumber = pow(10, Double(places))
//        var n = self
//        n = n * precisionNumber
//        n.round()
//        n =  n / precisionNumber
//        return n
//    }
//}
//
//var myDouble = 3.14159
//let myRoundedDouble = String(format: "%.1f", myDouble)
////myDouble.round()
//myDouble.round(to: 3)


//Extending proprietary Classes
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height:50))
button.backgroundColor = .red
button.layer.cornerRadius = 25
button.clipsToBounds = true

extension UIButton {
    func makeCircular() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height:50))
button2.backgroundColor = .green
button2.makeCircular()

