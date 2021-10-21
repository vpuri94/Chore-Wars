//
//  Task.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/19/21.
//

import Foundation
let date = Date()

struct Task: Identifiable{
    var id: String = UUID().uuidString
    var name: String;
    var points: Double = 0.0;
    var dueDate: Date;
    var review: Double = 0.0;
    var claimed: User? = nil;
    var score: Double = self.points * self.review;
  
    init(name: String, points: Double,dueDate: Date) {
        self.name = name
        self.points  = points
        self.dueDate = dueDate
    }
    
    func getDate(){
        print(dueDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        print(dateFormatter.string(from: dueDate))
    }
    
    func isClaimed() -> Bool{
        if claimed != nil{
            return true
        }
        return false
    }
    
}
