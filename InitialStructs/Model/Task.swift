//
//  Task.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/19/21.
//

import FirebaseFirestore
import Foundation
let date = Date()
//

struct Task: Identifiable{
    var id: String = UUID().uuidString
    let name: String;
    let points: Int;
    let dueDate: Date;
    let completed: Bool = false;
    let reviewed: Bool = false;
    let review: Int = 0;
    var claimed: User? = nil;
    var team: Team? = nil;
    
    init(name: String,points: Int,dueDate: Date) {
        self.name = name
        self.points  = points
        self.dueDate = dueDate
    }
    
    func taskDict() ->[String: Any]{
        let dict: [String:Any] = [
            "name": self.name,
            "points": self.points,
            "dueDate": self.dueDate,
            "completed": self.completed,
            "reviewed": self.reviewed,
            "review": self.review,
            "claimed": self.claimed as Any,
            "team": self.team as Any
            ]
        return dict
    }
    
    func getDate()-> String {
        print(dueDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        print(dateFormatter.string(from: dueDate))
        return (dateFormatter.string(from: dueDate))
    }
    mutating func setUser(user:User) {
        self.claimed = user
    }
    func getUserName() -> String{
        return claimed?.displayName ?? ""
    }

    
    func isClaimed() -> Bool{
        if claimed != nil{
            return true
        }
        return false
    }
    func isNotClaimed() -> Bool{
        if claimed == nil{
            return true
        }
        return false
    }
    
    
}
