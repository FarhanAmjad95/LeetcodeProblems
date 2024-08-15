import Cocoa
/*
 
 Given a string s, return the longest
 palindromic
  
 substring
  in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  

 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.
 
 */


func longestPalindrome(_ s: String) -> String {
    let characters = Array(s)
    
    if s.isEmpty || s.count == 1 {
        return s
    }
    
    var start = 0
    var maxLength = 1
    
    func expandAroundCenter(left: Int, right: Int) {
        var left = left
        var right = right
        
        while left >= 0 && right < s.count && characters[left] == characters[right] {
            let currentLength = right - left + 1
            if currentLength > maxLength {
                start = left
                maxLength = currentLength
            }
            left -= 1
            right += 1
        }
    }

    for i in 0..<s.count {
        expandAroundCenter(left: i, right: i)
        expandAroundCenter(left: i, right: i + 1)
    }
    
    let startIdx = s.index(s.startIndex, offsetBy: start)
    let endIdx = s.index(startIdx, offsetBy: maxLength)
    return String(s[startIdx..<endIdx])
}

print(longestPalindrome("babad")) // Output: "bab" or "aba"
print(longestPalindrome("cbbd"))  // Output: "bb"

