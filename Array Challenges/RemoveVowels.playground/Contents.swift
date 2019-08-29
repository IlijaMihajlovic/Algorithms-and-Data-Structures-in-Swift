
import Foundation

var str = "AllooJ, ddd"

extension String {
func stringByRemovingVowels() -> String {
    var newWord = self

//    for vowel in ["a","A", "e", "i", "o","u"]
//Clener Version with .forEach
    ["a","A", "e", "i", "o","u"].forEach { (vowel) in
        newWord = newWord.replacingOccurrences(of: vowel, with: "")
    }

    return newWord

    }
}
print(str.stringByRemovingVowels())
