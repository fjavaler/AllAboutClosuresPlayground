import UIKit

let num1 = 13
let num2 = 7

// Traditional syntax for func.
func add(_ num1: Int, to num2: Int) -> Int {
  return num1 + num2
}

// Closure alternative syntax
let add2 = { (num1: Int, num2: Int) -> Int in
  return num1 + num2
}

// Closure alternative syntax can be restated as:
let add3: (Int, Int) -> Int = { (num1, num2) in
  return num1 + num2
}

// Or, as:
let add4: (Int, Int) -> Int = {
  return $0 + $1
}

print("add1: \(add(num1, to: num2))")
print("add2: \(add2(num1,num2))")
print("add3: \(add3(num1, num2))")
print("add4: \(add4(num1, num2))")


// You can add closures to an array (as long as they are of the same type)!
let funcsArray = [
  add,
  add2,
  add3,
  add4
]

let addFunc = funcsArray[0]
print("addFunc: \(addFunc(1,2))")

let addFunc2 = funcsArray[1]
print("addFunc2: \(addFunc2(1,2))")

// You can also add closures to a dictionary!
let funcsDictionary = [
  "add": add,
  "add2": add2,
  "add3": add3,
  "add4": add4
]

let addFunc3 = funcsDictionary["add"]!
print("addFunc3: \(addFunc3(1,2))")

let addFunc4 = funcsDictionary["add2"]!
print("addFunc4: \(addFunc4(1,2))")

// Pass a parameter as a function
func operation(num1: Int, num2: Int, result: (Int, Int) -> Void) {
  let add = num1 + num2
  let sub = num1 - num2
  result(add, sub)
}

// Call to operation
operation(num1: 10, num2: 11, result: { addition, subtraction in
  print("The addition is: \(addition)")
  print("The subtraction is: \(subtraction)")
})

// Call can be restated as (trailing closure):
operation(num1: 10, num2: 11) { addition, subtraction in
  print("The addition is (trailing closure): \(addition)")
  print("The subtraction is (trailing closure): \(subtraction)")
}

func game() -> () -> Int {
  var multiplier = 0
  
  let increase = { () -> Int in
    print("Closure reached!")
    multiplier += 1
    return multiplier
  }
  
  print("return reached!")
  return increase
}

// Call game()
let game1 = game()
print(game1())
print(game1())
