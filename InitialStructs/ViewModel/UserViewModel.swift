//
//  UserViewModel.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation


import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject{
    @Published var user = [User]()
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
                self.db.collection("User").document(userId).updateData(["totalPoints": totalPoints])
            } else {
                print("Document does not exist")
            }
        }
//            var user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints)
    }

}
