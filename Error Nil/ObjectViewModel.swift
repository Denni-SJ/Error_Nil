//
//  ObjectViewModel.swift
//  Error Nil
//
//  Created by J on 11/6/2023.
//

import Foundation
import RealmSwift


class ViewModel: ObservableObject {
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
}
