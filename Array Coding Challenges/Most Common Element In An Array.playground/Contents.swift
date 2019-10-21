
import Foundation


// 2. Most Common Element In An Array
func mostCommonNameInArray(array: [String]) -> String {
    
    //The dictionary that holds the count for each element in the array
    var nameCountDictionary = [String: Int]()
    
    // Count the values with using forEach
    array.forEach { nameCountDictionary[$0] = (nameCountDictionary[$0] ?? 0) + 1 }
    
    //Storring the most common name that occurs inside our array
    var mostCommonName = ""
    
    for key in nameCountDictionary.keys {
        //If we don't have yet a most common element in the array put any element for now
        if mostCommonName == "" {
            mostCommonName = key
            
        } else {
            guard let count = nameCountDictionary[key] else { return "Some parametar is nil"}
            
            //if the count is greater the current most common element set it
            if count > nameCountDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key): \(nameCountDictionary[key]!)")
    }
    return mostCommonName
}

//Exexute or call this funcion on our array
mostCommonNameInArray(array: ["a", "b", "a", "c", "a", "b","a"])



// 3. Use a function to find common elements in two sequences
func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var common: [T.Iterator.Element] = []
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    common.append(lhsItem)
                }
            }
        }
        return common
}

commonElements([1,2,3], [3])


