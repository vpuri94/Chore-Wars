//
//  ContentView.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var user: UserViewModel
    @ObservedObject var tasks = TaskViewModel()
//    @ObeservedObject private var id = user.currentUserID
    @State var showNewView = false
    @State var count = 1
//    var currentUserTasks: [Task] = user.currentUserTasks
    @Binding var tabSelection: Int
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView {
            ZStack (alignment:.topLeading){
                VStack (alignment:.leading){
                    ScoreCardView(user: user)
                        .onTapGesture {
                            tabSelection = 2
                        }
                        .clipShape(Rectangle())
                        .frame(width:width*0.9, height:200)
                        .shadow(radius:3)
                        .padding()
                    Text("To-Do")
                        .font(.custom("Montserrat-Bold",size: 19))
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                        .padding(.leading, 25)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    List(self.user.currentUserTasks, id: \.id) {eachTask in
                        ToDoRow(task: eachTask)
                    }
                    .background(Color(UIColor.systemBackground))
                } .padding(.top, 20)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: Menu(user: user)){
                        Image(systemName: "list.bullet").imageScale(.large)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Dashboard").font(.custom("Montserrat-Regular",size: 22))
                    }
                }
            }
                .onAppear(){
                    self.user.getTasksForCurrentUser(userId: user.currentUserID)
                    
                }
            
        }
    }
}

extension Color {
    static let lighterGray = Color(red: 0.98, green: 0.98, blue: 0.98)
}

