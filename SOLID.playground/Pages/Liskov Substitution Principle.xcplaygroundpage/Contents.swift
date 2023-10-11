/*
 The Liskov Substitution Principle (LSP)
 FUNCTIONS THAT USE POINTERS OR REFERENCES TO BASE CLASSES MUST BE ABLE TO USE OBJECTS OF DERIVED CLASSES WITHOUT KNOWING IT.

 Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program

 Solutions
 - Break the Hierarchy
 - "Tell, don't task"
*/
import Foundation
print("===== Product Discount Example =====")
/*
 // MARK: Problem
 - The InHouseProduct which is a subclass of Product has function called applyExtraDiscount which is called in the ProductUtils which affects the correctness of the program which breaks the LSP principle
 */
class ProductOld {
    fileprivate var discount = 20.0
    func getDiscount() -> Double {
        discount
    }
}
class InHouseProductOld: ProductOld {
    func applyExtraDiscount() {
        discount = discount * 1.5
    }
}
class ProductUtilsOld {
    let p1 = ProductOld()
    let p2 = InHouseProductOld()
    var products: [ProductOld] = []
    init() {
        products.append(p1)
        products.append(p2)
        for product in products {
            if let inHouseProduct = product as? InHouseProductOld {
                inHouseProduct.applyExtraDiscount()
            }
            print(product.getDiscount())
        }
    }
}
ProductUtilsOld()
/*
 // MARK: Solutions
 - The InHouseProduct which is a subclass of Product has function which use the method getDiscount which belong to the superclass so it does not effect the correctness of the program.
 - Not checking if the product is of type InHouseProductOld implements the Tell don't ask principle
 */
class Product {
    fileprivate var discount = 20.0
    func getDiscount() -> Double {
        discount
    }
}
class InHouseProduct: Product {
    override func getDiscount() -> Double {
        applyExtraDiscount()
        return discount
    }
    func applyExtraDiscount() {
        discount = discount * 1.5
    }
}
class ProductUtils {
    let p1 = Product()
    let p2 = InHouseProduct()
    var products: [Product] = []
    init() {
        products.append(p1)
        products.append(p2)
        for product in products {
            print(product.getDiscount())
        }
    }
}
ProductUtils()

print("===== Polygon Example =====")
/*
 // MARK: Problem
 - The client has the current method printArea so the result should always be the same in the both calls so it breaks the LSP principle
 */
class RectangleOld {
    var width: Float = 0
    var length: Float = 0
    var area: Float {
        return width * length
    }
}
class SquareOld: RectangleOld {
    override var width: Float {
        didSet {
            length = width
        }
    }
}
class AreaCalculatorOld {
    func printArea(rectangle: RectangleOld) {
        rectangle.length = 5
        rectangle.width = 2
        print(rectangle.area)
    }
}
let calculatorOld = AreaCalculatorOld()
let rectangleOld = RectangleOld()
let squareOld = SquareOld()
calculatorOld.printArea(rectangle: rectangleOld)
calculatorOld.printArea(rectangle: squareOld)

/*
 // MARK: Solution
 - We can solve it using a protocol with a method area, implemented by Rectangle and Square in different ways. Finally, we change the printArea parameter type to accept an object which implement this protocol so that client should give same result
 */

protocol Polygon {
    var area: Float { get }
}

class Rectangle: Polygon {

    private let width: Float
    private let length: Float

    init(width: Float, length: Float) {
        self.width = width
        self.length = length
    }

    var area: Float {
        return width * length
    }
}

class Square: Polygon {

    private let side: Float

    init(side: Float) {
        self.side = side
    }

    var area: Float {
        return pow(side, 2)
    }
}
class AreaCalculator {
    func printArea(of polygon: Polygon) {
        print(polygon.area)
    }
}
let calculator = AreaCalculator()
let rectangle = Rectangle(width: 2, length: 5)
calculator.printArea(of: rectangle)

let square = Square(side: 2)
calculator.printArea(of: square)


