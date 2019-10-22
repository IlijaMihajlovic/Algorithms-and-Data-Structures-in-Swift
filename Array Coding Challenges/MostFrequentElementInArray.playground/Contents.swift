import UIKit

// Most Frequent Element In An Array
// We use hashable to let the Dictionary conform to Hashable protocol
func mostFrequent<T: Hashable>(array: [T]) -> (value: T, count: Int)? {

    //The dictionary that holds the count for each element in the array
    let counts = array.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    //Find the most frequent value and its count with max(by:) else array was empty
   guard let (value, count) = counts.max(by: { $0.1 < $1.1}) else { return nil }
   
   return (value, count)
}

if let result = mostFrequent(array: [1,2,4,5,6,7,8,8,8]) {
    print("'\(result.value)' Occurs: \(result.count) Times.")
}
