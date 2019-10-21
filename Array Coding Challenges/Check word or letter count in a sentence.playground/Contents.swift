
import UIKit

//1.
func SpecificLetterCount(str:String, char:Character) ->Int {
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
func SpecificWordCount(forString:String, inWord:String) ->Int {
    let words = forString.components(separatedBy: " ")
    var count = 0
    
    words.forEach { (word) in
        if word == inWord {
            count += 1
        }
    }
    
    return count
}

//3.
func CountAllWords(str:String) ->[String: Int] {

    let words = str.components(separatedBy: " ")
    var wordcount = [String: Int]()
    words.forEach { (word) in
        wordcount.updateValue(SpecificWordCount(forString: str, inWord: word), forKey: word)
    }

    return wordcount
}


let wordCount = SpecificWordCount(forString: "Il est mon meilleur ami il est mon meilleur ami tho", inWord: "est")
print("Word Count: " + String(describing: wordCount))
