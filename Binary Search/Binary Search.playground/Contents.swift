
// Time complexity O(log n)

/*There are two conditions that need to be met before binary search may be used:
• The collection must be able to perform index manipulation in constant time. This
means that the collection must be a RandomAccessCollection.
• The collection must be sorted. */

import Foundation

//Since binary search only works for types that conform to RandomAccessCollection, you add the method in an extension on RandomAccessCollection. This extension is constrained as you need to be able to compare elements.
public extension RandomAccessCollection where Element: Comparable {
   
    // Binary search is recursive, so you need to be able to pass in a range to search. The parameter range is made optional so you can start the search without having to specify a range. In this case, where range is nil, the entire collection will be searched.
    func binarySearch(for value: Element, in range: Range<Index>? = nil)
        -> Index? {
            
            //First, you check if range was nil. If so, you create a range that covers the entire collection.
            let range = range ?? startIndex..<endIndex
            
            //Then, you check if the range contains at least one element. If it doesn’t, the search has failed and you return nil.
            guard range.lowerBound < range.upperBound else {
                return nil
            }
            
            //Now that you’re sure you have elements in the range, you find the middle index in the range.
            let size = distance(from: range.lowerBound, to: range.upperBound)
            let middle = index(range.lowerBound, offsetBy: size / 2)
            
           // You then compare the value at this index with the value that you’re searching for. If they match, you return the middle index.
            if self[middle] == value {
                return middle
               
                // If not, you recursively search either the left or right half of the collection.
            } else if self[middle] > value {
                return binarySearch(for: value, in: range.lowerBound..<middle)
            } else {
                return binarySearch(for: value, in: index(after:
                    middle)..<range.upperBound)
            }
    }
    
}

let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

let binarySearch5 = array.binarySearch(for: 5)
print("binarySearch(for:): \(String(describing: binarySearch5))")
