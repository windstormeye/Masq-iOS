//
//  MASCoreData.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/28.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import CoreData

class MASCoreData {
    static let shared = MASCoreData()
    var persistentContainer: NSPersistentContainer!
    
//    init() {
//        // 初始化容器
//        let container = NSPersistentCloudKitContainer(name: "MASDataModel")
//
//        // 初始化本地存储
//        let local = NSPersistentStoreDescription(url: URL(fileURLWithPath: "/files/local.sqlite"))
//        local.configuration = "Local"
//
//        // 初始化远程存储
//        let share = NSPersistentStoreDescription(url: URL(fileURLWithPath: "/files/cloud.sqlite"))
//        share.configuration = "Cloud"
//        // 配置 CloudKit 远端存储
//        share.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.pjhusb.masq")
//
//        // 设置容器需要管理的存储
//        container.persistentStoreDescriptions = [local, share]
//    }
    
    /// 创建一个存储容器
    class func createMASDataModel(completion: @escaping () -> ()) {
        // 名字要与 `.xcdatamodeleld` 文件名一致
        let container = NSPersistentContainer(name: "MASDataModel")
        
        container.loadPersistentStores { (_, err) in
            guard err == nil else { fatalError("Failed to load store: \(err!)") }
            DispatchQueue.main.async {
                self.shared.persistentContainer = container
                completion()
            }
        }
    }
}
