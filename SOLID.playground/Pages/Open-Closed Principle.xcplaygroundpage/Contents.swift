/*
 The Open-Closed Principle (OCP)
 SOFTWARE ENTITIES (CLASSES, MODULES, FUNCTIONS, ETC.) SHOULD BE OPEN FOR EXTENSION, BUT CLOSED FOR MODIFICATION.
*/

import Foundation

print("===== Insurance Premium Discount calculator Example =====")
/*
 // MARK: Problem
 - InsurancePremiumDiscountCalculator has calculatePremiumDiscountPercent in the beginning with HealthInsuranceCustomerProfile but if we need to add a new customer profile i.e VehicleInsuranceCustomerProfile; we have to make change to the method by adding calculateVehiclePremiumDiscountPercent which violets the OCP principle.
*/
class InsurancePremiumDiscountCalculatorOld {
    func calculatePremiumDiscountPercent(customer: HealthInsuranceCustomerProfileOld) -> Int {
        if customer.isLoyalCustomer() {
            return 20;
        }
        return 0;
    }
    func calculateVehiclePremiumDiscountPercent(customer: VehicleInsuranceCustomerProfileOld) -> Int {
        if customer.isLoyalCustomer() {
            return 20;
        }
        return 0;
    }
}

class HealthInsuranceCustomerProfileOld {
    func isLoyalCustomer() -> Bool {
        Bool.random()
    }
}
class VehicleInsuranceCustomerProfileOld {
    func isLoyalCustomer() -> Bool {
        Bool.random()
    }
}

let calculatorOld = InsurancePremiumDiscountCalculatorOld()
let healthCustomerProfileOld = HealthInsuranceCustomerProfileOld()
let vehicleCustomerProfileOld = VehicleInsuranceCustomerProfileOld()
print(calculatorOld.calculatePremiumDiscountPercent(customer: healthCustomerProfileOld))
print(calculatorOld.calculateVehiclePremiumDiscountPercent(customer: vehicleCustomerProfileOld))

/*
 // MARK: Solution
 - By this way the main method or function InsurancePremiumDiscountCalculator is not changed and it is easier to extend the functionality i.e LifeInsuranceCustomerProfile
 */

class InsurancePremiumDiscountCalculator {
    func calculatePremiumDiscountPercent(customer: CustomerProfile) -> Int {
        if customer.isLoyalCustomer() {
            return 20;
        }
        return 0;
    }
}
protocol CustomerProfile {
    func isLoyalCustomer() -> Bool
}
class HealthInsuranceCustomerProfile: CustomerProfile {
    func isLoyalCustomer() -> Bool {
        Bool.random()
    }
}
class VehicleInsuranceCustomerProfile: CustomerProfile {
    func isLoyalCustomer() -> Bool {
        Bool.random()
    }
}
class LifeInsuranceCustomerProfile: CustomerProfile {
    func isLoyalCustomer() -> Bool {
        Bool.random()
    }
}

let calculator = InsurancePremiumDiscountCalculator()
let healthCustomerProfile = HealthInsuranceCustomerProfile()
let vehicleCustomerProfile = VehicleInsuranceCustomerProfile()
let lifeCustomerProfile = LifeInsuranceCustomerProfile()
print(calculator.calculatePremiumDiscountPercent(customer: healthCustomerProfile))
print(calculator.calculatePremiumDiscountPercent(customer: vehicleCustomerProfile))
print(calculator.calculatePremiumDiscountPercent(customer: lifeCustomerProfile))

print("===== Area calculator Example =====")
/*
 // MARK: Problem
 - AreaCalculator has area method in the beginning with only Rectangle but if we need to add a new shape i.e Circle; we have to make change to the method by checking if it is a circle type or rectangle type which violets the OCP principle.
*/
class RectangleOld {
    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}
class CircleOld {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
}
class AreaCalculatorOld {
//    func area(rectangle: Rectangle) -> Double {
//        return rectangle.width * rectangle.height
//    }
    func area(shape: AnyObject) -> Double {
        var area: Double = 0
        if let rectangle = shape as? RectangleOld {
            area = rectangle.width * rectangle.height
        } else if let circle = shape as? CircleOld {
            area = .pi * circle.radius * circle.radius
        }
        return area
    }
}
let areaCalculatorOld = AreaCalculatorOld()
let rectangleOld = RectangleOld(width: 10, height: 10)
let circleOld = CircleOld(radius: 10)
print(areaCalculatorOld.area(shape: rectangleOld))
print(areaCalculatorOld.area(shape: circleOld))

/*
 // MARK: Solution
 - By this way the main method or function area is not changed and it is easier to extend the functionality i.e Circle
 */

protocol Shape {
    func area() -> Double
}
class Rectangle: Shape {
    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func area() -> Double {
        self.width * self.height
    }
}
class Circle: Shape {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    func area() -> Double {
        .pi * self.radius * self.radius
    }
}
class AreaCalculator {
    func area(shape: Shape) -> Double {
        shape.area()
    }
}
let areaCalculator = AreaCalculator()
let rectangle = Rectangle(width: 10, height: 10)
let circle = Circle(radius: 10)
print(areaCalculator.area(shape: rectangle))
print(areaCalculator.area(shape: circle))
