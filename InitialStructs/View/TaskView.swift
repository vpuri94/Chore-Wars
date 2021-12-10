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
                    Text("")
                    Spacer()
                    HStack(alignment: .center, spacing: 10){
                        Text(" Unclaimed ")
                            .font(.custom("Montserrat-Bold",size: 25))
                            .foregroundColor(check ? Color.textCol: .gray)
                            .underline(color: check ? Color.textCol: Color.lighterGray)
                            .onTapGesture {
                            check = true
                        }
                        Text(" Claimed ")
                            .font(.custom("Montserrat-Bold",size: 25))
                            .foregroundColor(check ? .gray: Color.textCol)
                            .underline(color: check ? Color.lighterGray: Color.textCol)
                            
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
//                                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                    }
                                    if(check == true && task.claimed == ""){
                                        TaskRow(task: task, user: user)
                                            .cornerRadius(10)
//                                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
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

extension Color{
    static var textCol = Color(red: 63/255, green: 143/255, blue: 176/255)
}
