
import Foundation

/*
 Fizz buzz is a group word game replacing any number divisible by three with the word "fizz", and any number divisible by five with the word "buzz".
 */

func fizzBuzz(fromNum: Int, toNum: Int) {

    (fromNum...toNum).forEach { (num) in

    // Perform the switch statement on the number
    switch num {
        //Check if 'x' is multiple of 3 and if 'x' is multiple of 5. If yes print fizzBuzz!
    case let x where x.isMultiple(of: 3) && x.isMultiple(of: 5):
        print("\(num): Fizz Buzz")

    case let x where x.isMultiple(of: 3):
        print("\(num): Fizz")

    case let x where x.isMultiple(of: 5):
        print("\(num): Buzz")

    default:
        print(num)
    }

}

}

fizzBuzz(fromNum: 0, toNum: 15)
