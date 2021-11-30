//
//  User.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//
import Foundation
import UIKit

struct User {
    var id: String!;
    let firstName: String!;
    let lastName: String!;
    let displayName: String!;
    let avatar: UIImage? = nil;
    var email: String;
    var team: String? = "";
    var totalPoints: Int = 0;
  
    init(id: String, firstName: String, lastName: String, displayName: String, totalPoints: Int, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.displayName = displayName
        self.totalPoints = totalPoints
        self.email = email
    }
    
    func userDict() ->[String: Any]{
        let dict: [String:Any] = [
            "id": self.id ?? "",
            "displayName": self.displayName ?? "",
            "firstName": self.firstName ?? "",
            "lastName": self.lastName ?? "",
            "avatar": self.avatar as Any,
            "team": self.team as Any,
            "totalPoints": self.totalPoints,
            "email": self.email
            ]
        return dict
    }
}
  
