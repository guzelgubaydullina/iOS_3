//
//  RealmService.swift
//  PawApp
//
//  Created by Guzel Gubaidullina on 20.05.2020.
//  Copyright © 2020 Guzel Gubaidullina. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    static let instance = RealmService()
    
    private init() {}
    
    func saveObjects<T: Object>(_ objects: [T]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(objects)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func fetchObjects<T: Object>(_ type: T.Type) -> [T]? {
        do {
            let realm = try Realm()
            return realm.objects(type).map{$0}
        } catch {
            print(error)
        }
        return nil
    }
    
    func deleteObjects<T: Object>(_ type: T.Type) {
        do {
            let realm = try Realm()
            if let objects = fetchObjects(type) {
                realm.beginWrite()
                realm.delete(objects)
                try realm.commitWrite()
            }
        } catch {
            print(error)
        }
    }
}
