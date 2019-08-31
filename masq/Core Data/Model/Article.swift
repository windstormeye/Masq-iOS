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
    var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
    var articles: [Article] = []
    var searchArticles = [Article]()
    
    fileprivate var fetchedResultsController: NSFetchedResultsController<Article>
    
    override init() {
        let request = Article.sortedFetchRequest
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                                   managedObjectContext: MASCoreData.shared.persistentContainer.viewContext,
                                                                   sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedResultsController.delegate = self
        
        // 执行方法后，立即返回
        try! fetchedResultsController.performFetch()
        articles = fetchedResultsController.fetchedObjects!
        objectWillChange.send()
    }
    
    func search(content: String) {
        let request = Article.searchRequest(content: content)
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        MASCoreData.shared.persistentContainer.viewContext.performChanges {
            self.articles = try! MASCoreData.shared.persistentContainer.viewContext.fetch(request)
            self.searchArticles = self.articles
            
            self.objectWillChange.send()
        }
    }
    
    /// 重新载入
    func reload() {
        guard searchArticles == articles else { return }
        
        let request = Article.sortedFetchRequest
        MASCoreData.shared.persistentContainer.viewContext.performChanges {
            self.articles = try! MASCoreData.shared.persistentContainer.viewContext.fetch(request)
            self.objectWillChange.send()
        }
    }
}

// MARK: NSFetchedResultsControllerDelegate
extension AritcleManager: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        articles = controller.fetchedObjects as! [Article]
        objectWillChange.send()
    }
}

final class Article: NSManagedObject, Identifiable {
    @NSManaged var content: String
    @NSManaged var type: Int16
    @NSManaged var uid: Int32
    @NSManaged var avatarImage: Int16
    @NSManaged var avatarColor: Int16
    @NSManaged internal var createdAt: Date
    
    static func insert(viewModel: Article.ViewModel) -> Article {
        let p_article: Article = MASCoreData.shared.persistentContainer.viewContext.insertObject()
        p_article.content = viewModel.content
        p_article.avatarColor = Int16(viewModel.avatarColor)
        p_article.avatarImage = Int16(viewModel.avatarImage)
        p_article.type = Int16(viewModel.type)
        p_article.uid = Int32(2015011206)
        p_article.createdAt = Date()
        
        return p_article
    }
    
    func delete() {
        MASCoreData.shared.persistentContainer.viewContext.performChanges {
            MASCoreData.shared.persistentContainer.viewContext.delete(self)
        }
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
