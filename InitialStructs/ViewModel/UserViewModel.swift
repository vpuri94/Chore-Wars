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
                let displayName = data["display_name"] as? String ?? ""
                let firstName = data["first_name"] as? String ?? ""
                let lastName = data["last_name"] as? String ?? ""
                let user = User(firstName: firstName, lastName: lastName, displayName: displayName)
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
