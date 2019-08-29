
func fibonacciSequence(numOfSteps: Int,  withNum firstNumber: Int, andNum secondNumber: Int) -> [Int] {

    //the first two numbers we want to start of
    var sequence = [firstNumber, secondNumber]

    if numOfSteps <= 1 {
        return sequence
    }

 //   for _ in 0...numOfSteps - 2 {
    (0...numOfSteps - 2).forEach { (_ ) in

        let first = sequence[sequence.count - 2] //Getting the previous value from the last value
        let second = sequence.last!
        sequence.append(first + second)
    }
    return sequence
}


print(fibonacciSequence(numOfSteps: 5, withNum: 1, andNum: 2))



