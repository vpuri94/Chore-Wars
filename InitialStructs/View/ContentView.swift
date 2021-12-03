//
//  ContentView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user = UserViewModel()
//    @State private var loggedIn = true
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
        switch user.signedIn {
        case true:
            TabViews(user: user)
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
    var body: some View{
        TabView {
            DashboardView(user: user).tabItem {
                    Image( "dashboard-icon")
                }
                LeaderboardView().tabItem{
                    Image( "leaderboard-icon")
                }
            AddNewChoreView(user: user).tabItem{
                    Image( "add-icon")
                }
            TaskView(user:user).tabItem{
                    Image("chores-icon")
                }
            TaskView(user:user).tabItem{
                    Image("reviews-icon")
                }
                
            }
            
            .background(Color.white)
            .clipShape(Rectangle())
            .shadow(radius: 3)
    }
}
