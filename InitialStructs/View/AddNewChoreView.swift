//
//  AddNewChore.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation
import SwiftUI

import SwiftUI


struct AddNewChoreView: View {

    let taskViewModel = TaskViewModel()
    @State private var name: String = ""
    @State private var points: String = ""
    @State private var dueDate = Date()
    var body: some View {
        VStack{
            TextField("Name", text: $name).padding()
            TextField("Points", text: $points).padding()
            DatePicker("DueDate", selection: $dueDate, in: Date()..., displayedComponents: .date).padding()
            Button("add Date", action:{
                self.taskViewModel.addData(name: name,points: points,dueDate: dueDate)
            })
        }.padding()
    }
}
