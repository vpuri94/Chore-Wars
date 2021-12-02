//
//  TaskRow.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/1/21.
//

import SwiftUI

struct TaskRow: View{
    @State var task: Task
//    let user = User(firstName: "Talha", lastName: "Subzwari" , displayName: "Copperbolt", totalPoints: 300)
    
    @ObservedObject  var user: UserViewModel
    @ObservedObject private var taskViewModel = TaskViewModel()
//    @ObservedObject private var userViewModel = UserViewModel()
    var body: some View{
        
        HStack{
            HStack (alignment:.center) {
                VStack (alignment:.leading){
                    Text(task.name)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Due \(task.getDate())")
                }.padding()
            }
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
            task.claimed = user.currentUserID
            taskViewModel.updateData(taskId: task.id
                                     , userID: user.currentUserID)
            user.updatePoints(userId: user.currentUserID, points: task.points)
        }
    }
    
    
    
}
