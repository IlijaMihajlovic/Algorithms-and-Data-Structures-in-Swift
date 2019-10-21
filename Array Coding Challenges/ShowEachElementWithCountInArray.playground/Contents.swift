import UIKit

extension Array where Element: Hashable {

    func countForElements() -> [Element: Int] {
        var counts = [Element: Int]()
        for element in self {
            counts[element] = (counts[element] ?? 0) + 1
        }
        counts.sorted{$0.value > $1.value}
        return counts
    }

}

let array2 = [4, 97, 97,4, 97, 23,23, 2]
print(array2.countForElements())
