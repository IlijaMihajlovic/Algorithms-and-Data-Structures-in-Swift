
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
func specificWordCount(forString:String, inWord:String) ->Int {
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
func countAllWords(str:String) ->[String: Int] {

    let words = str.components(separatedBy: " ")
    var wordcount = [String: Int]()
    words.forEach { (word) in
        wordcount.updateValue(specificWordCount(forString: str, inWord: word), forKey: word)
    }

    return wordcount
}


let wordCount = specificWordCount(forString: "Il est mon meilleur ami il est mon meilleur ami tho", inWord: "est")
print("Word Count: " + String(describing: wordCount))
