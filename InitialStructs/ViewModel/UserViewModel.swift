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
    @Published var users = [User]()
    @Published var currentUser: User? = nil
    @Published var currentUserTasks = [Task]()
    @Published var incompleteTasksForCurrentUser = [Task]()
    @Published var currentUserID = ""
    @Published var currentUserEmail = ""
    @Published var currentUserTeam = ""
    @Published var signedIn = false

    
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("User").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let displayName = data["displayName"] as? String ?? ""
                let firstName = data["firstName"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let team = data["team"] as? String ?? ""
                let totalPoints = data["totalPoints"] as? Int ?? 0
                let email = data["email"] as? String ?? ""
                var user = User(id: id, firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints, email: email)
                user.team = team
                return user
            }
        }
    }
    
    func addData(id: String, firstName:String, lastName: String, displayName: String, email: String, totalPoints: Int = 0){
        let user = User(id: id, firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints, email: email)
        db.collection("User").addDocument(data: user.userDict())
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
    
    func getUser(userId: String){
        let getUser = db.collection("User").document(userId )
        getUser.getDocument { (document, error) in
            if let document = document, document.exists {
                let id = document.get("id") as? String ?? ""
                let displayName = document.get("displayName") as? String ?? ""
                let firstName = document.get("firstName") as? String ?? ""
                let lastName = document.get("lastName") as? String ?? ""
                let team = document.get("team") as? String ?? ""
                let totalPoints = document.get("totalPoints") as? Int ?? 0
                let email = document.get("email") as? String ?? ""
                var user = User(id: id, firstName: firstName,
                                lastName: lastName, displayName: displayName, totalPoints:
                                    totalPoints, email: email)
                user.team = team
                self.currentUser = user
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func getUserFromEmail(email: String){
        db.collection("User").whereField("email", isEqualTo:email)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("here")
                        print("\(document.documentID) => \(document.data())")
                        let id  = document["id"] as? String ?? ""
                        let displayName = document["displayName"] as? String ?? ""
                        let firstName = document["firstName"] as? String ?? ""
                        let lastName = document["firstName"] as? String ?? ""
                        let email = document["email"] as? String ?? ""
                        let team = document["team"] as? String ?? ""
                        let totalPoints = document["totalPoints"] as? Int ?? 0
                        self.currentUser = User(id: id, firstName: firstName,
                                                lastName: lastName, displayName: displayName,
                                                totalPoints: totalPoints, email: email)
            
//                        self.currentUserEmail = email
                        self.currentUserID = id
                        self.currentUserTeam  = team
                        print("here")
                    }
                }
        }
        
    }
    
    func getTasksForCurrentUser(userId: String){
        currentUserTasks = [Task]()
        
        db.collection("Task").whereField("claimed", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
                        let id  = document["id"] as? String ?? ""
                        let name = document["name"] as? String ?? ""
                        let points = document["points"] as? Int ?? 0
                        let dueDate = document["dueDate"] as? Date ?? NSDate.now
                        let category = document["category"] as? String ?? ""
                        let team = document["team"] as? String ?? ""

                        let newTask = Task(id: id, name: name, points: points, dueDate: dueDate, claimed: self.currentUserID, category: category, teamName: team)
                        self.currentUserTasks.append(newTask)
                    }
                }
        }
    }
    func incompleteTasks(){
       incompleteTasksForCurrentUser = currentUserTasks.filter{ $0.isNotCompleted() }
    }

    
}
