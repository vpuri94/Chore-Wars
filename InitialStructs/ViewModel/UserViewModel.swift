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
                var user = User(firstName: firstName, lastName: lastName, displayName: displayName)
                user.team = team
                user.totalPoints = totalPoints
                return user
            }
        }
    }
    
    func addData(firstName:String, lastName: String, displayName: String){
        let ref: DocumentReference? = nil
        let user = User(firstName: firstName, lastName: lastName, displayName: displayName  )
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
}
