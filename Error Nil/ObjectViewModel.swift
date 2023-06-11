//
//  ObjectViewModel.swift
//  Error Nil
//
//  Created by Antonio Perez on 9/6/2023.
//

import SwiftUI
import RealmSwift


class ViewModel: ObservableObject {
    //@Published var iterator: Int = 0
    //@Published var didPerformInitialization: Bool = false
//    @Published var ID: String = ""
    @Published var BigIdea1: String = ""
    @Published var BigIdea2: String = ""
    @Published var Challenge1: String = ""
    @Published var Investigate1: String = ""
    @Published var Investigate2: String = ""
    @Published var Personae1: String = ""
    @Published var Personae2: String = ""
    @Published var Solution1: String = ""
    @Published var Solution2: String = ""
    
   
   
    
    func clearDatabase() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
                print("Database cleared successfully")
            }
        } catch let error {
            print("Error clearing database: \(error)")
        }

      }

    func saveResponse() {
        do {
            let realm = try Realm()
            try realm.write {
                let object = UserInfo()
                //object.ID = userID
                object.BigIdea1 = BigIdea1
                object.BigIdea2 = BigIdea2
                object.Challenge1 = Challenge1
                object.Investigate1 = Investigate1
                object.Investigate2 = Investigate2
                object.Personae1 = Personae1
                object.Personae2 = Personae2
                object.Solution1 = Solution1
                object.Solution2 = Solution2
                realm.add(object)
                print("Response saved: \(object.BigIdea1) and \(object.BigIdea2)")
            }
        } catch {
            print("Error saving to Realm: \(error)")
        }
    }
 

    func fetchDataFromDatabase() {
            do {
                let realm = try Realm()
                guard let userInfo = realm.objects(UserInfo.self).first else {
                    print("No data found in the database")
                    return
                }
                
                // Update the view model properties with the fetched values
                BigIdea1 = userInfo.BigIdea1
                BigIdea2 = userInfo.BigIdea2
                // Update the remaining properties accordingly
                
                print("Data fetched from the database: \(BigIdea1) and \(BigIdea2)")
            } catch {
                print("Error fetching data from Realm: \(error)")
            }
        }
}
