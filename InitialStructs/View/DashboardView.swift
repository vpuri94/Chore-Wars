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
//    var currentUserTasks: [Task] = user.currentUserTasks

    var body: some View {
        NavigationView {
            ZStack (alignment:.topLeading){
                Color.lighterGray
                    .ignoresSafeArea()
                VStack (alignment:.leading){
                    ScoreCardView(user: user)
                        .padding()
                        .background(Color.white)
                        .frame(width:UIScreen.main.bounds.width)
                        .clipShape(Rectangle())
                        .shadow(radius: 3)
                    Text("To-Do")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                        .padding(.leading, 30)
                    
                    List(self.user.currentUserTasks, id: \.id) {eachTask in
                        ChoreRow(task: eachTask)
                    }
                } .padding(.top, 20)
                
            }

                .navigationBarTitle("Dashboard", displayMode: .inline)
                .onAppear(){
                    self.user.getTasksForCurrentUser(userId: user.currentUserID)
                    self.
                }
            .navigationBarItems(leading:
                                    NavigationLink(destination: Menu(user: user)){
                                        Image(systemName: "list.bullet").imageScale(.large)
                                    }
            )
            
        }
    }
}

extension Color {
    static let lighterGray = Color(red: 0.98, green: 0.98, blue: 0.98)
}

