//
//  TaskRow.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/1/21.
//

import SwiftUI

struct TaskRow: View{
    @State var task: Task
    @ObservedObject  var user: UserViewModel
    @ObservedObject private var taskViewModel = TaskViewModel()
    
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
            Spacer()
            Text(String(task.points)).padding()
            if(isClaimed()){
                VStack(alignment: .leading){
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 42, height: 42)
//                        Text(user.getUser(userId: task.claimed ?? "").displayName )
                    }
                }
            }else {
                Image(systemName: isClaimed() ? "checkmark" : "plus")
                    .foregroundColor(isClaimed() ? Color(UIColor.systemBlue) : Color.secondary)
                    .onTapGesture {
                        claimAChore()
                    }
            }
        }.padding().cornerRadius(10)
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
