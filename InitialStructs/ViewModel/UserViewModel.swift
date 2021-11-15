//
//  UserViewModel.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation


import Foundation
import FirebaseFirestore
import SwiftUI

class UserViewModel: ObservableObject{
    @Published var user = [User]()
    @Published var currentUser: User? = nil
    @Published var currentUserTasks = [Task]()
    
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("User").addSnapshotListener{ (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                return
            }
            self.user = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                let displayName = data["displayName"] as? String ?? ""
                let firstName = data["firstName"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let team = data["team"] as? String ?? ""
                let totalPoints = data["totalPoints"] as? Int ?? 0
                var user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints)
                user.team = team
                return user
            }
        }
    }
    
    func addData(firstName:String, lastName: String, displayName: String){
        let ref: DocumentReference? = nil
        let user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: 0  )
        db.collection("User").addDocument(data: user.userDict())
        {
            err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID )")
            }
        }
    }
    func updatePoints(userId:String,points:Int){
        let user = db.collection("User").document(userId)
        user.getDocument { (document, error) in
            if let document = document, document.exists {
                var totalPoints = document.get("totalPoints")
                totalPoints = totalPoints as! Int + points
                self.db.collection("User").document(userId).updateData(["totalPoints": totalPoints ?? 0])
            } else {
                print("Document does not exist")
            }
        }
//            var user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints)
    }
    
    func getUser(userId:String){
   
        let getUser = db.collection("User").document(userId)
        getUser.getDocument { (document, error) in
            if let document = document, document.exists {
                let displayName = document.get("displayName") as? String ?? ""
                let firstName = document.get("firstName") as? String ?? ""
                let lastName = document.get("lastName") as? String ?? ""
                let team = document.get("team") as? String ?? ""
                let totalPoints = document.get("totalPoints") as? Int ?? 0
                var user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints)
                user.team = team
                self.currentUser = user
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func getTasksForCurrentUser(userId:String){
        currentUserTasks = [Task]()
        
        db.collection("Task").whereField("claimed", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let id  = document["id"] as? String ?? ""
                        let name = document["name"] as? String ?? ""
                        let points = document["points"] as? Int ?? 0
                        let dueDate = document["dueDate"] as? Date ?? NSDate.now
                        let category = document["category"] as? String ?? ""
                        let newTask = Task(id: id, name: name, points: points, dueDate: dueDate, claimed: userId, category: category)
                        self.currentUserTasks.append(newTask)
                    }
                }
        }
    }
}
