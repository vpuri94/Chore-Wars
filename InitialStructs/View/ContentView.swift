//
//  ContentView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            DashboardView().tabItem {
                Image( "dashboard-icon")
            }
            LeaderboardView().tabItem{
                Image( "leaderboard-icon")
            }
            AddNewChoreView().tabItem{
                Image( "add-icon")
            }
            TaskView().tabItem{
                Image("chores-icon")
            }
            TaskView().tabItem{
                Image("reviews-icon")
            }
            
        }
        
        .padding()
        .background(Color.white)
        .clipShape(Rectangle())
        .shadow(radius: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
