
//Merge Sort is one of the most efficient sorting algorithms.
// Time complexity Big O(n log n)

/*
1. The strategy of merge sort is to divide and conquer, so that we solve many small problems instead of one big problem.
2. It has two core responsibilities: a method to divide the initial array recursively, as well as a method to merge two arrays.
3. The merging function should take two sorted arrays and produce a single sorted array.
*/

import Foundation

public func mergeSort<Element>(_ array: [Element])
    -> [Element] where Element: Comparable {
        
        // Recursion needs a base case, which you can also think of as an “exit condition.” In this case, the base case is when the array only has one element.
        guard array.count > 1 else {
            return array
        }
       
        let middle = array.count / 2
        
        // You’re now calling mergeSort on the left and right halves of the original array. As soon as you’ve split the array in half, you’ll try to split again.
        let left = mergeSort(Array(array[..<middle]))
        let right = mergeSort(Array(array[middle...]))
        
        // Because we call mergeSort recursively, the algorithm will split and sort both halves before merging them together.
        return merge(left, right)
        
}


//The final step is to merge the left and right arrays together. To keep things clean we'll create a separate merge function for this.

// The sole responsibility of the merging function is to take in two sorted arrays and combine them while retaining the sort order.


private func merge<Element>(_ left: [Element], _ right: [Element])
    -> [Element] where Element: Comparable {
       
        // The leftIndex and rightIndex variables track your progress as you parse through the two arrays.
        var leftIndex = 0
        var rightIndex = 0
       
        // The result array will house the combined array.
        var result: [Element] = []
       
        // Starting from the beginning, you compare the elements in the left and right arrays sequentially. If you’ve reached the end of either array, there’s nothing else to compare.
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            // The smaller of the two elements goes into the result array. If the elements were equal, they can both be added.
            if leftElement < rightElement {
                result.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                rightIndex += 1
            } else {
                result.append(leftElement)
                leftIndex += 1
                result.append(rightElement)
                rightIndex += 1
            } }
        
        // The first loop guarantees that either left or right is empty. Since both arrays are sorted, this ensures that the leftover elements are greater than or equal to the ones currently in result. In this scenario, you can append the rest of the elements without comparison.
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        return result
}

let array = [7,2,1,10,3,9,5,8,6,4,]
print("Original: \(array)")
print("Merge sorted: \(mergeSort(array))")
