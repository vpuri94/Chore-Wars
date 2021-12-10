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
    @Environment(\.presentationMode) var presentationMode
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
            ScrollView(.vertical) {
                VStack{
                    VStack{
                        Text("Chore Name")
                            .font(.custom("Montserrat-Bold",size: 20))
                            .foregroundColor(.gray)
                            .frame(width: width-50,alignment: .leading)
                        TextField("Enter Name",text: $name)
                            .font(.custom("Montserrat-SemiBold",size: 25))
                            .foregroundColor(.black)
                            .frame(width: width-50)
                        Divider()
                            .frame(width: width-50, height: 2)
                            .padding(.horizontal, 10)
                    }.padding()
                    Spacer()
                    Spacer()
                    VStack{
                        Text("Possible Points Earned")
                            .font(.custom("Montserrat-Bold",size: 20))
                            .foregroundColor(.gray)
                            .frame(width: width-50,alignment: .leading)
                        TextField("Enter Points",text: $points)
                            .font(.custom("Montserrat-SemiBold",size: 25))
                            .foregroundColor(.black)
                            .frame(width: width-50)
                        Divider()
                            .frame(width: width-50,height: 2)
                            .padding(.horizontal, 10)
                    }
                    VStack {
                        HStack{
                            Text("Start Date")
                                .font(.custom("Montserrat-Bold",size: 20))
                                .foregroundColor(.gray)
                                
                            DatePicker("", selection: $startDate, in: Date()..., displayedComponents: .date).padding()
                        }
                        HStack{
                            Text("Due Date")
                                .font(.custom("Montserrat-Bold",size: 20))
                                .foregroundColor(.gray)
                               
                            DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date).padding()
                        }
                    }.frame(width:width-50)
                    VStack (spacing: 1){
                        Spacer()
                        Text("Category")
                            .font(.custom("Montserrat-Bold",size: 20))
                            .foregroundColor(.gray)
                            .frame(width: width-50,alignment: .leading)
                        ForEach(categories, id:\.self){ category in
                            Button(action:{
                                cat = category
                            }){
                                HStack {
                                    Image("\(category.lowercased())")
                                        .padding()
                                    Text(category)
                                      //  .frame(width:width-100)
                                        .padding()
                                        .font(.custom("Montserrat-Medium",size: 20))
                                        .foregroundColor(.black)
                                }.frame(width: width-50)
                            }
                            .buttonStyle(FilledButton())
                        }
                        .frame(width:width-50)
                        Button( action:{
                            cat = "String"
                        },label:{
                            Text("Add New Category")
                                .frame(width:width-100)
                                .padding()
                                .font(.custom("Montserrat-Medium",size: 20))
                                .foregroundColor(.black)
                        }).disabled(true)
                            .buttonStyle(FilledButton())
                    }
                    
                    Button(action:{
                        self.taskViewModel.addData(name: name,points: points,dueDate: dueDate, category: cat, teamName: user.currentUserTeam)
                    }, label:{
                        Text("Add Chore")
                            .font(.custom("Montserrat-SemiBold",size: 25))
                            .padding()
                            .foregroundColor(Color(UIColor.systemBackground))
                        
                    }
                    )
                    .background(Color(UIColor.turquoise))
                    .clipShape(RoundedRectangle(cornerRadius:10))
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel"){
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Add New Chore")
                                .font(.custom("Montserrat-Regular",size: 22))
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
        }
    }
    
    struct FilledButton: ButtonStyle {
        @Environment(\.isEnabled) private var isEnabled
        
        func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .background(configuration.isPressed ? Color(UIColor.turquoise) : Color(UIColor.systemBackground))
                .padding()
                .clipShape(RoundedRectangle(cornerRadius:10))
                .shadow(radius:3)
        }
    }
}
