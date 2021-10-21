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
    let name: String;
    let points: Int;
    let dueDate: Date;
    let completed: Bool = false;
    let reviewed: Bool = false;
    let review: Int = 0;
    let claimed: User? = nil;
    
    init(name: String,points: Int,dueDate: Date) {
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
