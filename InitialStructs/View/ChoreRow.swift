//
//  ChoreRow.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct ChoreRow: View {
    @State var task : Task
//    @State var user = UserViewModel()
    @State private var checked = true
    var body: some View {
//    List(self.user.currentUserTasks, id: \.id) { eachTask in
        HStack (alignment:.center) {
            VStack (alignment:.leading){
                Text(task.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Due \(task.getDate())")
            }.padding()
            Spacer()
            VStack{
                CheckBoxView(checked: $checked)
                    .padding()
                Text("Completed")
                Spacer()
                Text(String(task.points))
                
            }
        }
    }
//    .onAppear(){
//        self.user.getTasksForCurrentUser(userId: "HkcEBsGUnrEXzNRFief1")
//    }
}

