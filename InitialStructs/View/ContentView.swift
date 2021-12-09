//
//  ContentView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user = UserViewModel()
//   @State private var loggedIn = true
//    @EnvironmentObject var authentication: Authentication
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor.white
        navBarAppearance.shadowColor = UIColor.gray
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = nil // or a custom tint color
        appearance.shadowImage = UIImage(named: "shadow")
        UINavigationBar.appearance().standardAppearance = appearance
    }
    var body: some View {
//        switch loggedIn {
        switch user.signedIn {
        case true:
            TabViews(user:user)
        case false:
            StartView(user: user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabViews: View{
    @ObservedObject  var user: UserViewModel
    @State var tabSelection = 1
    var body: some View{
        TabView(selection: $tabSelection) {
            DashboardView(user: user, tabSelection: $tabSelection).tabItem {
                Image("dashboard-icon")
                    .renderingMode(.template)
                    .frame(minWidth: 30, minHeight: 100)
                }
            .tag(1)
            LeaderboardView(tabSelection: $tabSelection).tabItem{
                    Image("leaderboard-icon")
                    .renderingMode(.template)
                        .frame(minWidth: 30, minHeight: 100)
                }
            .tag(2)
            AddNewChoreView(user: user).tabItem{
                    Image("add-icon")
                   
                        .frame(minWidth: 30, minHeight: 100)
                }
            TaskView(user:user).tabItem{
                    Image("chores-icon")
                    .renderingMode(.template)
                        .frame(minWidth: 30, minHeight: 100)
                }
            TaskView(user:user).tabItem{
                    Image("reviews-icon")
                    .renderingMode(.template)
                        .frame(minWidth: 30, minHeight: 50)
                }
                
            }
            .accentColor(Color(UIColor.turquoise))
            .background(Color.white)
            .clipShape(Rectangle())
            .shadow(radius: 3)
            .ignoresSafeArea()
    }
}


