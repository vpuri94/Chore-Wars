//
//  CompleteChoreRow.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 12/3/21.
//

import SwiftUI

struct CompletedChoreRow: View {
    @State var task : Task

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
                Image(systemName: "checkmark" )
                .foregroundColor(Color.secondary)
            
                Text("Completed")
                Spacer()
                Text(String(task.points))
            }
        }
    }

}
