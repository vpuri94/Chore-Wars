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
    var completed: Bool = false;
    let reviewed: Bool = false;
    let review: Int = 0;
    let category: String;
    var claimed: String? = ""; // user ID later on
    var team: String = "";
    
    init(id: String = "", name: String,points: Int,dueDate: Date, claimed: String = "", category: String, teamName: String) {
        self.id = id
        self.name = name
        self.points  = points
        self.dueDate = dueDate
        self.claimed = claimed
        self.category = category
        self.team = teamName
    }
    
    func taskDict() ->[String: Any]{
        let dict: [String:Any] = [
            "name": self.name,
            "points": self.points,
            "dueDate": self.dueDate,
            "completed": self.completed,
            "reviewed": self.reviewed,
            "review": self.review,
            "category": self.category,
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
    
    
    func isClaimed() -> Bool{
        if claimed != ""{
            return true
        }
        return false
    }
    func isNotClaimed() -> Bool{
        if claimed == ""{
            return true
        }
        return false
    }
    func isCompleted() -> Bool {
        return self.completed
        
    }
    func isNotCompleted() -> Bool {
        return !self.completed
        
    }
    
    
}
