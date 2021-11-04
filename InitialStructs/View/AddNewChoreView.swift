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
    var width  = UIScreen.main.bounds.width
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("Chore Name")
                        .font(.headline).frame(width: width-50, height: 10 ,alignment: .topLeading)
                        .foregroundColor(.gray)
                    TextField("Name", text: $name).frame(width: width-50, height: 10, alignment: .center).padding()
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 30)
                     .background(Color.gray)
                }.frame(width: width, height: 100, alignment: .topLeading)
                
                    
                VStack{
                    Text("Possible Points Earned").font(.headline).frame(width: width-50, height: 100 ,alignment: .leading).foregroundColor(.gray)
                    TextField("Points",text: $points)
                        .font(.custom("Montserrat", size: 30))
                        .foregroundColor(.blue)
                        .frame(width: width-50, height: 10,alignment: .leading)
                }
                VStack{
                    DatePicker("DueDate", selection: $dueDate, in: Date()..., displayedComponents: .date).padding()
                    Button("Add Chore", action:{
                        self.taskViewModel.addData(name: name,points: points,dueDate: dueDate)
                    }).foregroundColor(.gray)
                }
//                .foregroundColor()
            }
            .padding()
            .navigationTitle("Add New Chore")
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
            
    }
    }
