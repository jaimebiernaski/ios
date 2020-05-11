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
print("Hello World! \(a) + \(b) = \(a+b)")

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

print(password)


// Functions
var name:String = "Bob";

func greetings () {
    print("Hello")
}

func greetings2 (name: String) {
    print("Hello \(name)")
}

for _ in 0...1 {
    greetings2(name: name)
}
    
var f = 3.4


// IF, ELSE & SWITCH

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore > 80 {
        print("You love each other like Kanyes loves Kanye")
    } else if loveScore > 40 {
        print ("You go together like Coke and Mentos")
    } else {
        print ("You will be forever alone")
    }
    print(loveScore)
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

loveCalculator2()




//OPTIONALS !? > Safety check

//var player1Username: String =  nil << Warning
var player1Username: String? =  nil
player1Username = "Jack"
print(player1Username)


let studentsAndscores = ["Amy": 88, "James": 55, "Helen": 99]
var highScore: Int? = nil
studentsAndscores.forEach { (key: String, value: Int) in
    if highScore == nil || value > highScore! {
        highScore = value
    }
}
print("High Score is \(highScore!)")





