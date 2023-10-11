/*
 The Dependency Inversion Principle (DIP)
 A. HIGH LEVEL MODULES SHOULD NOT DEPEND UPON LOW LEVEL MODULES. BOTH SHOULD DEPEND UPON ABSTRACTIONS.
 B. ABSTRACTIONS SHOULD NOT DEPEND UPON DETAILS. DETAILS SHOULD DEPEND UPON ABSTRACTIONS.
*/


import UIKit

print("===== Ecommerce Application Example =====")
/*
 // MARK: Problem
 The high level module ProductCatalog is dependent on the low level module SQLProductRepository so it breaks the DIP principle.
*/

class ProductCatalogOld {
    func listAllProducts() {
        let sqlProductRepository = SQLProductRepositoryOld()
        print(sqlProductRepository.getAllProductName())
    }
}
class SQLProductRepositoryOld {
    func getAllProductName() -> [String] {
        return ["TV", "Oven"]
    }
}
ProductCatalogOld().listAllProducts()
/*
 // MARK: Solution
 The high level module ProductCatalog and the low level module SQLProductRepository now both depend on ProductRepository which is an abstraction so it does not break the IDP principle.

 SQLProductRepository which is a detail now depends on the abstraction which is ProductRepository so it follows the IDP principle.

*/
class EcommerceMainApplication {
    func start() {
        let productCatalog = ProductCatalog(productRepository: ProductFactory().create())
        productCatalog.listAllProducts()
    }
}

class ProductCatalog {
    private var productRepository: ProductRepository
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    func listAllProducts() {
        print(productRepository.getAllProductName())
    }
}

class ProductFactory {
    func create() -> ProductRepository {
        return SQLProductRepository()
    }
}

protocol ProductRepository {
    func getAllProductName() -> [String]
}
class SQLProductRepository: ProductRepository {
    func getAllProductName() -> [String] {
        return ["TV", "Oven"]
    }
}

EcommerceMainApplication().start()

print("===== Storage Example =====")
/*
 // MARK: Problem
 The high level module Handler is dependent on the low level module FileSystemManager so it breaks the DIP principle.
*/
class HandlerOld {
    let fileManager = FileSystemManagerOld()
    func handle() {
        fileManager.save()
    }
}

class FileSystemManagerOld {
    func save() {
        print("Save something using File System")
    }
}
HandlerOld().handle()

/*
 // MARK: Solution
 The high level module Handler and the low level module FileSystemManager now both depend on Storage which is an abstraction so it does not break the IDP principle.

 FileSystemManager which is a detail now depends on the abstraction which is Storage so it follows the IDP principle.

 */

class Handler {
    let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }
    func handle() {
        storage.save()
    }
}

protocol Storage {
    func save()
}
class FileSystemManager: Storage {
    func save() {
        print("Save something using File System")
    }
}
class DatabaseManager: Storage {
    func save() {
        print("Save something using database")
    }
}
let fileHandler = Handler(storage: FileSystemManager())
fileHandler.handle()
let dbHandler = Handler(storage: DatabaseManager())
dbHandler.handle()

