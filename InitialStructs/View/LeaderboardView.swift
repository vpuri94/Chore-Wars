//
//  TaskView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import SwiftUI

struct LeaderboardView: View {

@State private var selection: String? = "A"
@ObservedObject private var taskViewModel = TaskViewModel()
@ObservedObject private var userViewModel = UserViewModel();

var width  = UIScreen.main.bounds.width
@State var rank: Int = 1
var body: some View {
       NavigationView {
         List(self.userViewModel.user.sorted(by: {$0.totalPoints > $1.totalPoints}),id: \.id) { eachUser in
           HStack{
             Text(eachUser.displayName)
             Spacer()
             Text(String(eachUser.totalPoints))
           }
         }
           .navigationBarTitle("Leaderboard").font(.custom("Montserrat", size: 20))
           .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                   self.taskViewModel.fetchData()
                   self.userViewModel.fetchData()
   //                var testingFilter = self.taskViewModel.tasks.filter{$0.isNotClaimed()}
                   print("here")
              
   //                print(testingFilter)
                   print("here")
           }
   }
}
}





struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}


