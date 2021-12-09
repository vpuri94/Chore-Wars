//
//  UserViewModel.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation


import Firebase
import FirebaseFirestore
import SwiftUI
import UserNotifications

class UserViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var teamUsers = [User]()
    @Published var currentUser: User? = nil
    @Published var currentUserTasks = [Task]()
    @Published var AllUserTasks = [Task]()
    @Published var incompleteTasksForCurrentUser = [Task]()
    @Published var currentUserID = ""
    @Published var currentUserEmail = ""
    @Published var currentUserTeam = ""
    @Published var signedIn = false
    @Published var taskUser: User? = nil

    
    
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
                let token = data["token"] as? String ?? ""
                var user = User(id: id, firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints, email: email, token: token)
                user.team = team
                return user
            }
        }
    }
    func fetchTeamData(){
        db.collection("User").whereField("team", isEqualTo: currentUserTeam).addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                return
            }
            self.teamUsers = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let displayName = data["displayName"] as? String ?? ""
                let firstName = data["firstName"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let team = data["team"] as? String ?? ""
                let totalPoints = data["totalPoints"] as? Int ?? 0
                let email = data["email"] as? String ?? ""
                let token = data["token"] as? String ?? ""
                var user = User(id: id, firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints, email: email, token: token)
                user.team = team
                self.currentUserTeam = AuthViewModel.currentTeam?.teamName ?? ""
                return user
            }
        }
    }
    
    func addData(id: String, firstName:String, lastName: String, displayName: String, email: String, totalPoints: Int = 0){        
        var fcmToken = Messaging.messaging().fcmToken
            Messaging.messaging().token { token, error in
            if let error = error{
                //nothing
            } else if let token = token{
                fcmToken = token
            }
        }
        let user = User(id: id, firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints, email: email, token: fcmToken ?? "")
        let doc = db.collection("User").addDocument(data: user.userDict())
        db.collection("User").document(doc.documentID).updateData(["id": doc.documentID])
        currentUserID = doc.documentID
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
    }
    
    func getUser(userId: String) -> User {
        let getUser = db.collection("User").document(userId )
        var user = User(id: "id", firstName: "firstName",
                        lastName: "lastName", displayName: "displayName", totalPoints:
                            0, email: "email", token: "token")
        getUser.getDocument { (document, error) in
            if let document = document, document.exists {
                let id = document.get("id") as? String ?? ""
                let displayName = document.get("displayName") as? String ?? ""
                let firstName = document.get("firstName") as? String ?? ""
                let lastName = document.get("lastName") as? String ?? ""
                let team = document.get("team") as? String ?? ""
                let totalPoints = document.get("totalPoints") as? Int ?? 0
                let email = document.get("email") as? String ?? ""
                let token = document.get("token") as? String ?? ""
                user = User(id: id, firstName: firstName,
                                lastName: lastName, displayName: displayName, totalPoints:
                                    totalPoints, email: email, token: token)
                user.team = team
                self.taskUser = user
                
            } else {
                print("Document does not exist")
            }
        }
        return user
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
                        let token = document.get("token") as? String ?? ""
                        self.currentUser = User(id: id, firstName: firstName,
                                                lastName: lastName, displayName: displayName,
                                                totalPoints: totalPoints, email: email, token: token)
                        self.currentUserEmail = email
                        self.currentUserID = id
                        self.currentUserTeam  = team
                        print("here")
                    }
                }
        }
        
    }
    
    func getTasksForCurrentUser(userId: String){
        currentUserTasks = [Task]()
        db.collection("Task").whereField("claimed", isEqualTo: userId).whereField("completed", isEqualTo: false)
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
    
    func getAllTasksForCurrentUser(){
        AllUserTasks = [Task]()
        
        db.collection("Task").whereField("claimed", isEqualTo: currentUserID).whereField("completed", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let id  = document["id"] as? String ?? ""
                        let name = document["name"] as? String ?? ""
                        let points = document["points"] as? Int ?? 0
                        let dueDate = document["dueDate"] as? Date ?? NSDate.now
                        let category = document["category"] as? String ?? ""
                        let teamName = document["team"] as? String ?? ""
                        let newTask = Task(id: id, name: name, points: points, dueDate: dueDate, claimed: self.currentUserID, category: category, teamName: teamName)
                        self.AllUserTasks.append(newTask)
                    }
                }
        }
    }
    
    func incompleteTasks(){
       incompleteTasksForCurrentUser = currentUserTasks.filter{ $0.isNotCompleted() }
    }
    
    func getTeamFromUser(){
        AuthViewModel.currentTeam = Team()
        db.collection("Team").whereField("team", isEqualTo: currentUserTeam )
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
                        AuthViewModel.currentTeam?.id  = document["id"] as? String ?? ""
                        AuthViewModel.currentTeam?.teamName = document["name"] as? String ?? ""
                        AuthViewModel.currentTeam?.joinCode = document["code"] as? String ?? ""
                        AuthViewModel.currentTeam?.currentReward = document["crntReward"] as? String ?? ""
                        AuthViewModel.currentTeam?.currentPunishment = document["crntPunishment"] as? String ?? ""
                        AuthViewModel.currentTeam?.lastRoundWinner = document["lastRoundWinner"] as? String ?? ""
                        AuthViewModel.currentTeam?.lastRoundLoser = document["lastRoundLooser"] as? String ?? ""
                    }
                }
        }
    }
    
}
