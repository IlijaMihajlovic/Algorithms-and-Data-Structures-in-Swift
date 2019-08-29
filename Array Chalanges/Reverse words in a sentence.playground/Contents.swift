
import UIKit

//.split Returns an array of subsequences, split from this collection’s elements O(n)
//.map Returns an array containing the transformed elements of this sequence. O(n)
//.reversed O(n)
//.joined Returns the concatenated elements of sequences, inserting the given separator between each element. O(n)

var str = "I am Swift Developer"
var word = "Developer"

//1. Reverse Word
func reverseWord(input: String) -> String {
  let result = input.split(separator: " ").map { String($0.reversed())}.joined(separator: " ")

    return result
}
let resultWord = reverseWord(input: word)
print(resultWord)


//2. ReverseSentence
func reverseSentence(_ sentence: String) -> String {

    var result = ""

    //create array of words      l
    let words = sentence.components(separatedBy: " ")


    //append words to result with a space
    for word in words.reversed() {
        result += "\(word) "

    }
    return result

}

let result = reverseSentence(str)
print(result)

