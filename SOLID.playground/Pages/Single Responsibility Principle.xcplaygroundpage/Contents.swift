/*
 The Single Responsibility Principle (SRP)
 THERE SHOULD NEVER BE MORE THAN ONE REASON FOR A CLASS TO CHANGE.
 Solution
 - High cohesion
 - Loose coupling
 */
import Foundation

print("===== Employee Manager Example =====")
/*
 // MARK: Problem
 - The class Employee has various reason to change like changes in Employee attributes, database and tax calculation so it violets SRP principle.
*/
enum EmployeeType {
    case fullTime, contract
}
extension EmployeeType {
    var taxPercentage: Float {
        switch self {
        case .fullTime:
            return 0.2
        case .contract:
            return 0.3
        }
    }
}

class EmployeeOld {
    var id: Int
    var name: String
    var employeeType: EmployeeType
    var salary: Float
    init(id: Int, name: String, salary: Float, employeeType: EmployeeType) {
        self.id = id
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
    }
    func save() {
        print("Employee \(self.name) is saved")
    }
    func calculateTax() {
        let tax = salary * self.employeeType.taxPercentage
        switch self.employeeType {
        case .fullTime:
            print("The full time employee tax is \(tax)")
        case .contract:
            print("The contract employee tax is \(tax)")
        }
    }
}
let fullTimeEmployeeOld = EmployeeOld(id: 1, name: "Robert", salary: 1000.0, employeeType: .fullTime)
let contractEmployeeOld = EmployeeOld(id: 2, name: "Rob", salary: 500.0, employeeType: .contract)
fullTimeEmployeeOld.save()
fullTimeEmployeeOld.calculateTax()
contractEmployeeOld.save()
contractEmployeeOld.calculateTax()

/*
 // MARK: Solution
 - The class Employee is broken down into different classes like TaxCalculator and EmployeeRepository so there is only one reason for one class to change so it does not violets SRP principle.
 */
class Employee {
    var id: Int
    var name: String
    var employeeType: EmployeeType
    var salary: Float
    init(id: Int, name: String, salary: Float, employeeType: EmployeeType) {
        self.id = id
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
    }
}
class TaxCalculator {
    func calculateTax(employee: Employee) {
        let tax = employee.salary * employee.employeeType.taxPercentage
        switch employee.employeeType {
        case .fullTime:
            print("The full time employee tax is \(tax)")
        case .contract:
            print("The contract employee tax is \(tax)")
        }
    }
}
class EmployeeRepository {
    func save(employee: Employee) {
        print("Employee \(employee.name) is saved")
    }
}
let fullTimeEmployee = Employee(id: 1, name: "Robert", salary: 1000.0, employeeType: .fullTime)
let contractEmployee = Employee(id: 2, name: "Rob", salary: 500.0, employeeType: .contract)
let taxCalculator = TaxCalculator()
let repository = EmployeeRepository()
taxCalculator.calculateTax(employee: fullTimeEmployee)
repository.save(employee: fullTimeEmployee)
taxCalculator.calculateTax(employee: contractEmployee)
repository.save(employee: contractEmployee)

print("===== Handler Example =====")
/*
 // MARK: Problem
 - The class Employee has various reason to change like changes in Employee attributes, database and tax calculation so it violets SRP principle.
 */
class HandlerOld {

    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDB(array: array)
    }
    private func requestDataToAPI() -> Data {
        var array = ["1", "2", "3"]
        let string = array.joined(separator:"-")
        return string.data(using: .utf8) ?? Data()
    }

    private func parse(data: Data) -> [String] {
        return String(data: data, encoding: .utf8)?.components(separatedBy: "-") ?? []
    }
    private func saveToDB(array: [String]) {
        print("saved \(array)")
    }
}
let handlerOld = HandlerOld()
handlerOld.handle()
/*
 // MARK: Solution
 - Moving the responsibilities down to little classes i.e APIHandler,ParseHandler and DBHandler. So each class has only one reason to change and it does not violets SRP principle
 */

class Handler {

    private let apiHandler: APIHandler
    private let parseHandler: ParseHandler
    private let dbHandler: DBHandler

    init(apiHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }

    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveToDB(array: array)
    }
}

class APIHandler {

    func requestDataToAPI() -> Data {
        var array = ["1", "2", "3"]
        let string = array.joined(separator:"-")
        return string.data(using: .utf8) ?? Data()
    }
}

class ParseHandler {

    func parse(data: Data) -> [String] {
        return String(data: data, encoding: .utf8)?.components(separatedBy: "-") ?? []
    }
}

class DBHandler {

    func saveToDB(array: [String]) {
        print("saved \(array)")
    }
}
let apiHandler =  APIHandler()
let parseHandler = ParseHandler()
let dbHandler =  DBHandler()
let handler = Handler(apiHandler: apiHandler, parseHandler: parseHandler, dbHandler: dbHandler)
handler.handle()
