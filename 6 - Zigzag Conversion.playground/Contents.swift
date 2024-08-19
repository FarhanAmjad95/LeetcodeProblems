import Cocoa

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else { return s }
    
    let sArray = Array(s)
    var rows = [String](repeating: "", count: numRows)
    var currentRow = 0
    var goingDown = false
    
    for ch in sArray {
        rows[currentRow].append(ch)
        
        if currentRow == 0 || currentRow == numRows - 1 {
            goingDown.toggle()
        }
        
        currentRow += goingDown ? 1 : -1
    }
    
    return rows.joined()
}
print(convert("PAYPALISHIRING", 4))
