//
//  ObjectViewModel.swift
//  Error Nil
//
//  Created by Junling Guan on 11/6/2023.
//

import Foundation
import RealmSwift

class ViewModel: ObservableObject {
    @Published var BigIdea1: String = ""
    @Published var BigIdea2: String = ""
    
    private var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print("Failed to create Realm instance: \(error)")
        }
    }
    
    func fetchDataFromDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        guard let userInfo = realm.objects(UserInfo.self).first else {
            print("No UserInfo object found in the database")
            return
        }
        
        DispatchQueue.main.async {
            self.BigIdea1 = userInfo.BigIdea1
            self.BigIdea2 = userInfo.BigIdea2
        }
    }


    
    func saveToDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                if let userInfo = realm.objects(UserInfo.self).first {
                    userInfo.BigIdea1 = BigIdea1
                    userInfo.BigIdea2 = BigIdea2
                } else {
                    let userInfo = UserInfo()
                    userInfo.BigIdea1 = BigIdea1
                    userInfo.BigIdea2 = BigIdea2
                    realm.add(userInfo)
                }
            }
        } catch {
            print("Failed to save to the database: \(error)")
        }
    }


    
    func clearDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Failed to clear the database: \(error)")
        }
    }
    
    func isDataSaved() -> Bool {
        guard let realm = realm else {
            print("Realm is not initialized")
            return false
        }
        
        return realm.objects(UserInfo.self).first != nil
    }
}
    

