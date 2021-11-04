//
//  TaskRow.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/1/21.
//

import SwiftUI

struct TaskRow: View{
    @State var task: Task
    let user = User(firstName: "Talha", lastName: "Subzwari" , displayName: "Copperbolt")
    @ObservedObject private var taskViewModel = TaskViewModel()
    var body: some View{
        
        HStack{
            Text(task.getDate())
            Text(task.name).padding()
            Text(String(task.points)).padding()
//            Text(String(task.getUserName()))
            Image(systemName: isClaimed() ? "checkmark" : "plus")
                        .foregroundColor(isClaimed() ? Color(UIColor.systemBlue) : Color.secondary)
                        .onTapGesture {
                            claimAChore()
                        }
            
        }
    }
    
    
    // MARK: User to claim functions
    func isClaimed() -> Bool{
        if task.claimed != ""{
            return true
        }
        return false
    }
    
     func claimAChore(){
        if(task.isNotClaimed()){
            task.claimed = user.id
            taskViewModel.updateData(id: task.id,user: user)
        }
    }
    
    
    
}