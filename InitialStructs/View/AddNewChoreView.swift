//
//  AddNewChore.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation
import SwiftUI



struct AddNewChoreView: View {

    let taskViewModel = TaskViewModel()
    @State private var name: String = ""
    @State private var points: String = ""
    @State private var dueDate = Date()
    @State private var startDate = Date()
    @ObservedObject  var user: UserViewModel
    var width  = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var categories = ["Outdoor","Cleaning","Shopping"]
    @State var cat = ""
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("Chore Name").font(.title).frame(width: width-50,alignment: .leading).foregroundColor(.gray)
                    TextField("Name",text: $name)
                        .font(.custom("Montserrat",size: 10))
                        .foregroundColor(.blue)
                                .frame(width: width-50)
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 10)
                     .background(Color.gray)
                }
//                .frame(width: width, height: 100, alignment: .topLeading)
                
                    
                VStack{
                    Text("Possible Points Earned").font(.headline).frame(width: width-50,alignment: .leading).foregroundColor(.gray)
                    TextField("Points",text: $points)
                        .font(.custom("Montserrat", size: 10))
                        .foregroundColor(.blue)
                        .frame(width: width-50)
                }
                Divider()
                    HStack{
                        Text("Start")
                        DatePicker("", selection: $startDate, in: Date()..., displayedComponents: .date).padding()
                    }
                    HStack{
                        Text("Due Date")
                        DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date).padding()
                    }

                ForEach(categories, id:\.self){ category in
                            Button(action:{
                                cat = category
                            }, label: {
                                Text(category)
                                    .frame(width:width-100)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 2)
                                    )
                                }
                            )
                        }
                    Button( action:{
                        cat = "String"
                    },label:{
                        Text("Add New Category")
                            .frame(width:width-100)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    }).disabled(true)
               
                    Button(action:{
                        self.taskViewModel.addData(name: name,points: points,dueDate: dueDate, category: cat, teamName: user.currentUserTeam)
                    }, label:{
                        Text("Add Chore")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .background(Color.blue)
                            )
                            .foregroundColor(Color.white)
                            
                        }
                    ).padding()
                }
            .padding()
            .navigationTitle("Add New Chore")
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}
