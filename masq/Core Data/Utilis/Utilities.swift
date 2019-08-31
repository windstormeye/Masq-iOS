//
//  Utilis.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/28.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import CoreData


// MARK: Managed
protocol Managed: class, NSFetchRequestResult {
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}


extension Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }

    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        return request
    }
    
    /// 创建搜索请求
    static func searchRequest(content: String) -> NSFetchRequest<Self> {
        let request = Self.sortedFetchRequest
        request.predicate = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Article.content), content)
        return request
    }
}


extension Managed where Self: NSManagedObject {
    static var entityName: String { return entity().name!  }
}


// MARK: NSManagedObjectContext
extension NSManagedObjectContext {
    func insertObject<T: NSManagedObject>() -> T where T: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: T.entityName, into: self) as? T else { fatalError("error object type") }
        return obj
    }
    
    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }

    /// 批量执行
    func performChanges(block: @escaping () -> ()) {
        perform {
            block()
            _ = self.saveOrRollback()
        }
    }
}
