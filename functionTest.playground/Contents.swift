//: Playground - noun: a place where people can play

import UIKit

func hasMatchCondition(lists: [Int], condition: (Int) -> Bool) -> [Int] {
    
    var newList = lists, count = 0;
    
    for list in lists {
        if condition(list) {
            newList[count] = 0;
        }
        count++;
    }
    return newList;
}


func oddNumber(num: Int) -> Bool {
    if (num % 2 != 0) {
        return true;
    }
    return false;
}
func evenNumber(num: Int) -> Bool {
    if (num % 2 == 0) {
        return true;
    }
    return false;
}
func primeNumber(num: Int) -> Bool {
    var count = 0;
    for i in 1 ..< num + 1 {
        if (num % i == 0) {
            count++;
        }
    }
    if (count == 2) {
        return true;
    }
    return false;
}


let numbersOne = [2, 3, 4, 5, 43, 31, 23, 68, 56, 88];
let numbersTwo = [5, 3, 2, 6, 4, 5, 6, 8, 1, 3, 2];

let a = hasMatchCondition(numbersOne, condition: oddNumber);
let b = hasMatchCondition(numbersTwo, condition: evenNumber);

let c = hasMatchCondition(numbersTwo, condition: primeNumber);