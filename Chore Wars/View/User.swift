//
//  User.swift
//  Chore Wars
//
//  Created by Viraj Puri on 10/20/21.
//

import Foundation
import UIKit

struct User {
    var id: String = UUID().uuidString
    let firstName: String!;
    let lastName: String!;
    let displayName: String!;
    let avatar: UIImage = nil;
    let team: Team
  
  init(firstName: String, lastName: String, displayName: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.displayName = displayName
    }
  
}
