//
//  Menu.swift
//  InitialStructs
//
//  Created by Viraj Puri on 12/2/21.
//

import SwiftUI

struct Menu: View {
    @ObservedObject private var taskViewModel = TaskViewModel()
    @ObservedObject  var user: UserViewModel
    var body: some View {
            NavigationView {
                    VStack{
                        Button(action: {
                            print("Account tapped!")
                        }) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                Text("My Account")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(40)
                        }
                        Button(action: {
                            print("Settings tapped!")
                        }) {
                            HStack {
                                Image(systemName: "gearshape")
                                    .font(.title)
                                Text("Team Settings")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(40)
                        }
                        Button(action: {
                            print(user.currentUserTeam)
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                    .font(.title)
                                Text("Reset")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                        }
                    }
                .navigationBarTitle("Chore Wars").font(.custom("Montserrat", size: 22))
                .navigationBarTitleDisplayMode(.inline)
                 .onAppear(){
                        self.taskViewModel.fetchData()
                        
                }
                
            }
    }
    /*
    func claimAChore(){
        
        
       if(task.isNotClaimed()){
           task.claimed = user.currentUserID
           taskViewModel.updateData(taskId: task.id
                                    , userID: user.currentUserID)
           user.updatePoints(userId: user.currentUserID, points: task.points)
       }
   }
 */
   
    
}

/*
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(user: user)
    }
}
*/
