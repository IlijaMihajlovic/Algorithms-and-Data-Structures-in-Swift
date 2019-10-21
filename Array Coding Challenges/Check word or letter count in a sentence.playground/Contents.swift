
import UIKit

//1.
func specificLetterCount(str:String, char:Character) ->Int {
    let letters = str
    var count = 0
    
    letters.forEach { (letter) in
        if letter == char {
            count += 1
        }
    }
    return count
}

//2.
func specificWordCount(inSentence:String, withWord:String) ->Int {
    let words = inSentence.components(separatedBy: " ")
    var count = 0
    
    words.forEach { (word) in
        if word == withWord {
            count += 1
        }
    }
    
    return count
}

//3.
func countAllWords(str:String) ->[String: Int] {

    let words = str.components(separatedBy: " ")
    var wordcount = [String: Int]()
    words.forEach { (word) in
        wordcount.updateValue(specificWordCount(inSentence: str, withWord: word), forKey: word)
    }

    return wordcount
}


let wordCount = specificWordCount(inSentence: "Il est mon meilleur ami il est mon meilleur ami tho", withWord: "est")
print("Word Count: " + String(describing: wordCount))
