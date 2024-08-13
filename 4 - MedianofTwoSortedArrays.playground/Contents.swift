import Cocoa
/*
 
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 The overall run time complexity should be O(log (m+n)).

  

 Example 1:

 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 Example 2:

 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
  

 Constraints:

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106

 */


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let ln1 = nums1.count, ln2 = nums2.count
    var arr = Array(repeating: 0, count: ln1 + ln2), lna = arr.count
    var i = ln1 - 1, t = ln2 - 1, c = lna - 1
    
    while c >= 0 {
        if t < 0 || i >= 0 && nums1[i] > nums2[t] {
            arr[c] = nums1[i]
            c = c - 1
            i = i - 1
        } else {
            arr[c] = nums2[t]
            c = c - 1
            t = t - 1
        }
    }
    let m = lna / 2
    return lna % 2 == 0 ? Double(arr[m-1] + arr[m]) / 2 : Double(arr[m])
}
// Test cases
let testCases = [
    ([1, 3], [2]),            // Merged array = [1, 2, 3], Median = 2.0
    ([1, 2], [3, 4]),         // Merged array = [1, 2, 3, 4], Median = (2 + 3) / 2 = 2.5
    ([], [1]),                // Merged array = [1], Median = 1.0
    ([2], []),                // Merged array = [2], Median = 2.0
    ([1, 2], [1, 2]),         // Merged array = [1, 1, 2, 2], Median = (1 + 2) / 2 = 1.5
    ([1, 3, 5], [2, 4, 6]),   // Merged array = [1, 2, 3, 4, 5, 6], Median = (3 + 4) / 2 = 3.5
    ([0, 0], [0, 0]),         // Merged array = [0, 0, 0, 0], Median = 0.0
    ([1, 3], [2, 7, 8, 9]),   // Merged array = [1, 2, 3, 7, 8, 9], Median = (3 + 7) / 2 = 5.0
]

for (index, testCase) in testCases.enumerated() {
    let (nums1, nums2) = testCase
    let result = findMedianSortedArrays(nums1, nums2)
    print("Test case \(index + 1): nums1 = \(nums1), nums2 = \(nums2) -> Median = \(result)")
}
