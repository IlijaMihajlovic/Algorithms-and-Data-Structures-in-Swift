
func averageNumber(arr: ClosedRange<Int>) -> Int{
    var average = 0
    var counter = 0
    
    arr.forEach{(elem) in //for elem in arr {
        
        average = elem  + average
        counter = counter + 1
        if(counter == arr.count){
            average = (average / arr.count)
        }
    }
    return average
}


averageNumber(arr: 1...1000)
