import Cocoa

/*
 
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

 

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

*/

public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        for j in 1+i..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

public func twoSumWithDicionary(_ nums: [Int], _ target: Int) -> [Int] {
  var dict: [Int: Int] = [:]
  for i in 0..<nums.count {
    var value = nums[i]
    if let index = dict[target - value] {
      return [index, i]
    }
    dict[value] = i
  }
  return []
}


public func twoSumSortedArray(_ nums: [Int], _ target: Int) -> [Int] {
  var left = 0
  var right = nums.count - 1
  
  while left < right {
    let sum = nums[left] + nums[right]
    if sum == target {
      return [left, right]
    } else if sum < target {
      left += 1
    } else {
      right -= 1
    }
  }
  return []
}


print(twoSum([2,11,15, 7], 9))
