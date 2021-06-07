import Foundation

struct Element: Equatable {
    var row: Int
    var column: Int
}

final class FillWithColor {
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        var result = image
        var elements = [Element]()
        var stack = [Element(row: row, column: column)]

        if image.isEmpty || row < 0 || column < 0 || row >= image.count || column >= image[0].count {
            return image
        }

        while stack.count > 0 {
            let element = stack.removeFirst()
            elements.append(element)

            if image[element.row][element.column] == image[row][column] {
                result[element.row][element.column] = newColor
            } else { continue }

            if (element.row - 1) >= 0 {
                let element = Element(row: element.row - 1, column: element.column)

                if !elements.contains(element) {
                    stack.append(element)
                }
            }

            if (element.row + 1) < image.count {
                let element = Element(row: element.row + 1, column: element.column)

                if !elements.contains(element) {
                    stack.append(element)
                }
            }

            if (element.column - 1) >= 0 {
                let element = Element(row: element.row, column: element.column - 1)

                if !elements.contains(element) {
                    stack.append(element)
                }
            }

            if (element.column + 1) < image[row].count {
                let element = Element(row: element.row, column: element.column + 1)

                if !elements.contains(element) {
                    stack.append(element)
                }
            }
        }

        return result
    }
}
