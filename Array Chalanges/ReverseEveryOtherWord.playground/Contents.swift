
import UIKit

let sampleSentence = "Reverse Every Other Word"

func reverseEveryOtherWord(sentence: String) -> String {

    let allWords = sampleSentence.components(separatedBy: " ")
    var newSentence = ""

    (0...allWords.count - 1).forEach { (index) in //preventing index out range error with -1
    //for index in 0...allWords.count - 1 {  

        let word = allWords[index]
        if newSentence != "" {
            newSentence += " "
        }

        //if the index of the word is odd reverse the word else skip the word
        if index % 2 == 1 {
            let reversedWord = String(word.reversed())
            newSentence += reversedWord
        } else {
            newSentence += word
        }



    }

    return newSentence
}
print(reverseEveryOtherWord(sentence: sampleSentence))
