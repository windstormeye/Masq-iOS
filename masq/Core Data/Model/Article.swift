//
//  Article.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/28.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import CoreData
import SwiftUI
import Combine


class AritcleManager: NSObject, ObservableObject {
    
    @Published var willChange = PassthroughSubject<Void, Never>()
    
    var articles = [Article]() {
        willSet {
            willChange.send(())
        }
    }
    fileprivate var fetchedResultsController: NSFetchedResultsController<Article>
    
    override init() {
        let request = Article.sortedFetchRequest
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: MASCoreData.shared.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedResultsController.delegate = self
        
        // 执行方法后，立即返回
        try! fetchedResultsController.performFetch()
        articles = fetchedResultsController.fetchedObjects!
    }
    
//    func fetch(page: Int) {
//
//    }
//
//    func objectAtIndexPath(_ indexPath: IndexPath) -> Article {
//        return fetchedResultsController.object(at: indexPath)
//    }
//
//    func reconfigureFetchRequest(_ configure: (NSFetchRequest<Article>) -> ()) {
//        NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: fetchedResultsController.cacheName)
//        configure(fetchedResultsController.fetchRequest)
//        do { try fetchedResultsController.performFetch() } catch { fatalError("fetch request failed") }
//    }
}

// MARK: NSFetchedResultsControllerDelegate
extension AritcleManager: NSFetchedResultsControllerDelegate {
    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
//                    didChangeContentWith diff: CollectionDifference<NSManagedObjectID>) {
//        articles = controller.fetchedObjects as! [Article]
//    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        articles = controller.fetchedObjects as! [Article]
    }
}

final class Article: NSManagedObject {
    @NSManaged var content: String
    @NSManaged var type: Int16
    @NSManaged var uid: Int32
    @NSManaged var avatarImage: Int16
    @NSManaged var avatarColor: Int16
    @NSManaged internal var createdAt: Date
    
    static func insert(viewModel: Article.ViewModel) -> Article {
        
        let context = MASCoreData.shared.persistentContainer.viewContext
        
        let p_article: Article = context.insertObject()
        p_article.content = viewModel.content
        p_article.avatarColor = Int16(viewModel.avatarColor)
        p_article.avatarImage = Int16(viewModel.avatarImage)
        p_article.type = Int16(viewModel.type)
        p_article.uid = Int32(2015011206)
        p_article.createdAt = Date()
        
        return p_article
    }
}

extension Article: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        // 根据「创建时间」降序
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }
}

extension Article {
    struct ViewModel {
        var content: String
        var type: Int
        var uid: Int
        var avatarImage: Int
        var avatarColor: Int
        
        init() {
            content = ""
            type = 0
            uid = -1
            avatarImage = -1
            avatarColor = -1
        }
    }
}
