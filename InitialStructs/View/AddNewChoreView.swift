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
    @State private var startDate = Date()
    var width  = UIScreen.main.bounds.width
    var categories = ["Outdoor","Cleaning","Shopping"]
    @State var cat = ""
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
                }
//                .frame(width: width, height: 100, alignment: .topLeading)
                
                    
                VStack{
                    Text("Possible Points Earned").font(.headline).frame(width: width-50, alignment: .leading).foregroundColor(.gray)
                    TextField("Points",text: $points)
                        .font(.custom("Montserrat", size: 30))
                        .foregroundColor(.blue)
                        .frame(width: width-50, height: 10,alignment: .leading)
                }
                Divider()
                VStack{
                    Text("Start")
                    DatePicker("", selection: $startDate, in: Date()..., displayedComponents: .date).frame(width: width-50, alignment: .center).padding()
                    Text("Due Date")
                    DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date).padding()
                    VStack{
                        ForEach(categories, id:\.self){ category in
                            Button(action:{
                                cat = category
                            }, label: {
                                Text(category)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 2)
                                    )
                                }
                            )
                        }
                    }
                }
                VStack{
                    Button(action:{
                        self.taskViewModel.addData(name: name,points: points,dueDate: dueDate, category: cat)
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
            }
            .padding()
            .navigationTitle("Add New Chore")
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
            
    }

}
