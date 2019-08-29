
/*
 Quicksort is a comparison-based sorting algorithm that uses the divide and conquer strategy
 
 Here's how it works. When given an array, quicksort() splits it up into three parts based on a "pivot" variable.
 
 All the elements less than the pivot go into a new array called less. All the elements equal to the pivot go into the equal array. And you guessed it, all elements greater than the pivot go into the third array, greater. This is why the generic type T must be Comparable, so we can compare the elements with <, ==, and >.
 
 Dividing the array around the pivot is called partitioning and there are a few different partitioning schemes.
 1.Choosing the middle element as a pivot
 1.Lomuto’s partitioning: Lomuto’s partitioning always chooses the last element as the pivot.
 2.Hoare’s  partitioning: Always chooses the first element as the pivot.
 3.Median Of Three: Finds the pivot by taking the median of the first, middle and last element.
 4.Dutch national flag partitioning: Dutch national flag partitioning is a good technique to use if we have a lot of duplicate elements.
 
 Once we have these three arrays, quicksort() recursively sorts the less array and the greater array, then glues those sorted subarrays back together with the equal array to get the final result. */

import Foundation

//This implementation recursively filters the array into three partions
public func quicksortMiddle<T: Comparable>(_ a: [T]) -> [T] {
    
    // There must be more than one element in the array. If not, the array is considered sorted.
    guard a.count > 1 else {
        return a }
    
    // Pick the middle element of the array as your pivot.
    let pivot = a[a.count / 2] // 2
    
    /*
     Using the pivot, split the original array into three partitions. Elements less than,
    equal to or greater than the pivot go into different buckets.
     */
    let less = a.filter { $0 < pivot } // 3
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    // Recursively sort the partitions and then combine them.
    return quicksortMiddle(less) + equal + quicksortMiddle(greater)
}

// Number 8 is middle element in this case the pivot
let array = [ 12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
print("Sorted Array: \(quicksortMiddle(array))")

/*
 less: [0, 3, 2, 1, 5, -1]
 equal: [8, 8]
 greater: [12, 9, 18, 27, 21]
 */

// A problem with Lomuto’s and Hoare’s algorithms is that they don’t handle duplicates really well. With Lomuto’s algorithm, duplicates end up in the less than partition and aren’t grouped together. With Hoare’s algorithm, the situation is even worse as duplicates can be all over the place.

//We'll chose the last element as the pivot as like by Lumutos partitiong
//partition (podela)
public func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int,
                                              high: Int, pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    
    // Whenever you encounter an element that is less than the pivot, move it to index smaller. This means that all elements that come before this index are less than the pivot.
    var smaller = low
    
    // Index equal points to the next element to compare. Elements that are equal to the pivot are skipped, which means that all elements between smaller and equal are equal to the pivot.
    var equal = low
    
    //  Whenever you encounter an element that is greater than the pivot, move it to index larger. This means that all elements that come after this index are greater than the pivot.
    var larger = high
    
    //The main loop compares elements and swaps them if needed. This continues until index equal moves past index larger, meaning all elements have been moved to their correct partition.
     while equal <= larger { // 4
        if a[equal] < pivot {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1 }
    }
    
    // The algorithm returns indices smaller and larger. These point to the first and last elements of the middle partition.
    return (smaller, larger)
}

public func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        
        // Here we can see how recrusion uses middleFirst and middleLast indices to determine the partitions that need to be sorted recursively.
        let (middleFirst, middleLast) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: high)
        quicksortDutchFlag(&a, low: low, high: middleFirst - 1)
        quicksortDutchFlag(&a, low: middleLast + 1, high: high)
    }
}

var arrayDutch = [ 12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8 ]

quicksortDutchFlag(&arrayDutch, low: 0, high: arrayDutch.count - 1)
print("QuickSort: \(arrayDutch)")
