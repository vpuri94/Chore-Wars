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
                Label("Dashboard",systemImage: "list.dash")
            }
            LeaderboardView().tabItem{
                Label("Leaderboard",systemImage: "list.number")
            }
            TaskView().tabItem{
                Label("Tasks",systemImage: "paintbrush")
            }
            AddNewChoreView().tabItem{
                Label("Add New Chore", systemImage: "plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
