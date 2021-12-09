    //
//  TaskView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import SwiftUI


struct TaskView: View {
    @ObservedObject  var user: UserViewModel
//    @State private var selection: String? = "A"
    @ObservedObject private var taskViewModel = TaskViewModel()
    @State var check = true
    
    var width  = UIScreen.main.bounds.width
    var body: some View {
            NavigationView {
                VStack{
                    VStack{
                        
                        ZStack{
                            Rectangle().frame(width: UIScreen.main.bounds.width-50, height: 75, alignment: .topLeading)
                                .cornerRadius(15)
                                .padding()
                                .foregroundColor(.blue)
                            HStack{
                                Image(systemName: "calendar")
                                    .frame(width: 100, height: 100, alignment: .leading)
                                Text("Calender")
                                    .font(.custom("Montserrat",size: 25))
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(alignment: .trailing)
                            }
                        }
                        
                        ZStack{
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width-50, height: 75, alignment: .trailing)
                                .cornerRadius(15)
                                .padding()
                                .foregroundColor(.orange)
                            HStack{
                                Image(systemName: "paintbrush")
                                    .frame(width: 100, height: 100, alignment: .leading)
                                Text("Saved Chores").font(.title2)
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 20){
                        Text(" Unclaimed ")
                            .foregroundColor(check ? Color.blue: Color.black)
                            .underline(color: check ? Color.blue: Color.lighterGray)
                            .onTapGesture {
                            check = true
                        }
                        Text(" Claimed ")
                            .foregroundColor(check ? Color.black: Color.blue)
                            .underline(color: check ? Color.lighterGray: Color.blue)
                            
                            .onTapGesture {
                            check = false
                        }
                    }
                    //MARK: Task section.
                        VStack{
                            List(taskViewModel.tasks,id: \.id){ task in
                                if(task.team == user.currentUserTeam){
                                    if(task.claimed != "" && check == false){
                                        TaskRow(task: task, user: user)
                                            .cornerRadius(10)
                                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                    }
                                    if(check == true && task.claimed == ""){
                                        TaskRow(task: task, user: user)
                                            .cornerRadius(10)
                                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                    }
                                }
                            }
                        }
                    }
                .navigationBarTitle("Tasks").font(.custom("Montserrat", size: 20))
                .navigationBarTitleDisplayMode(.inline)
                 .onAppear(){
                        self.taskViewModel.fetchData()
                        
                }
            }
    }
}
