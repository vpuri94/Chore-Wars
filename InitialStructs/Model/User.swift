//
//  User.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//
import Foundation
import UIKit

struct User {
    var id: String = UUID().uuidString
    let firstName: String!;
    let lastName: String!;
    let displayName: String!;
    let avatar: UIImage? = nil;
    var team: String? = "";
    var totalPoints: Int = 0;
  
  init(firstName: String, lastName: String, displayName: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.displayName = displayName
    }
    
    func userDict() ->[String: Any]{
        let dict: [String:Any] = [
            "displayName": self.displayName ?? "",
            "firstName": self.firstName ?? "",
            "lastName": self.lastName ?? "",
            "avatar": self.avatar as Any,
            "team": self.team as Any,
            "totalPoints": self.totalPoints,
            ]
        return dict
    }
}
  
