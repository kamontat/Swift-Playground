//: Playground - noun: a place where people can play

import UIKit
// string
var str = "Hello, playground, ";
// cast String to Int
var text = Int("1234");
// if variable don't assign value
var none: String? = nil;
// number
var num = 9;
var double = 9.5;
// swift can't change data type double to int or everything
var result = Double(num) / double;

// print
print("Hello  \(num)");
// let is declare variable which don't want to change it
let constrant: String = "W";

// how to declare variable, But can change anymore
var float:Float = 9.4;
var bool:Bool = true;
// Array
var emplyArray = [Int]();
var array = [1, 2, 3, 4, 4, 3, 4, 1, 3];
// length of array
array.count;
// Dictionary
var dictionary = [
    "name": ["net", "nar"],
    "surname": ["chan", "sim"]
];
// Tuple
var myStatus = (Life: (HP: 98100, MP: 43010), Fight: (Attack: 1250, defense: 3200));
myStatus.Life.HP;
myStatus.Fight.Attack;

// dictionary
var occupations = [
    "I": "ME",
    "You": "YOUR",
];
occupations["He"] = "HIM";

print(occupations);

// array
var array1 = [1, 27, 49, 14, 64, 33, 44, 67, 12, 76, 12, 43, 22];

// how to use for to count element in array
var count = 0;
// edit for in swift 3
for i in 0..<array1.count {
    count += 1;
}
count;

// check which number is largest number in array
var larges = 0;
for (numbers) in array1 {
    if numbers > larges {
        larges = numbers;
    }
}
larges

// sum all number in array
var sum = 0;
for (numbers) in array1 {
    sum += numbers;
}
sum

// function sumOf
func sumOf (numbers: Int...) -> Int {
    var sum = 0;
    for number in numbers {
        sum += number;
    }
    return sum;
}

sumOf();
sumOf(1, 2, 3, 4);

// function that assign operation and get result
func cal(text: String, first: Int, numbers: Int...) -> Int {
    var temp = first;
    for number in numbers {
        if text == "add" {
            temp += number;
        } else if text == "subtract" {
            temp -= number;
        } else if text == "multiply" {
            temp *= number;
        } else if text == "divide" {
            temp /= number;
        }
    }
    return temp;
}

cal("add", first: 10, numbers: 1, 2);
cal("multiply", first:  43, numbers: 14, 23);

var a = 0;
var b = a + 5;
a = b + 1;
var c = a - 4;

// function that check number that input is or not prime number;
func checkPrime(num: Int) -> Bool {
    var count = 0;
    for (var i = 1; i <= num; i += 1) {
        if num % i == 0 {
            count += 1;
        }
    }
    
    if (count == 2) {
        return true;
    }
    return false;
}

checkPrime(7);
checkPrime(10);

var optionalName: String? = nil;
var greeting = "Hello!";
// how to use if and let together
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Nothing";
}
// How to use ?? operation
var nickname: String? = nil;
var fullname: String = "Kamontat";
var name = nickname ?? fullname;
// Switch Case
switch name {
case let z where z.hasSuffix("at"):
    print("A");
default:
    print("Error");
}

// calculates the average of its arguments
func average(nums: Double...) -> Double {
    var count: Double = 0;
    var sum: Double = 0;
    for num in nums {
        count++;
        sum += num;
    }
    return sum / count;
}
average(5.3, 100, 43, 12, 0.657);

// test about nested function
func test(var y: Int) -> Int {
    func add() {
        y += 5;
        func multiply() {
            y *= 2;
        }
        multiply();
    }
    add();
    add();
    return y;
}

test(10);

// A function that take another funtion as argument
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number;
    }
    return addOne;
}
var increment = makeIncrementer();

increment(7);
