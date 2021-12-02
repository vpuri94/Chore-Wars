    //
//  TaskView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import SwiftUI


struct TaskView: View {
    @ObservedObject  var user: UserViewModel
    @State private var selection: String? = "A"
    @ObservedObject private var taskViewModel = TaskViewModel()
    
    var width  = UIScreen.main.bounds.width
    var body: some View {
            NavigationView {
                VStack{
                    VStack{
                        
                        ZStack{
                            Rectangle().frame(width: UIScreen.main.bounds.width-50, height: 75, alignment: .topLeading)
                                .cornerRadius(15)
                                .padding()
                                .foregroundColor(.blue)
                            HStack{
                                Image(systemName: "calendar")
                                    .frame(width: 100, height: 100, alignment: .leading)
                                Text("Calender")
                                    .font(.custom("Montserrat",size: 25))
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(alignment: .trailing)
                            }
                        }
                        
                        ZStack{
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width-50, height: 75, alignment: .trailing)
                                .cornerRadius(15)
                                .padding()
                                .foregroundColor(.orange)
                            HStack{
                                Image(systemName: "paintbrush")
                                    .frame(width: 100, height: 100, alignment: .leading)
                                Text("Saved Chores").font(.title2)
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 20){
                        Text(" Claimed ")
                        Text(" Unclaimed ")
                    }
                    //MARK: Task section.
                        VStack{
                            List(taskViewModel.tasks,id: \.id){ task in
                                TaskRow(task: task, user: user)
                                
                            }
                        }
                    }
                .navigationBarTitle("Tasks").font(.custom("Montserrat", size: 20))
                .navigationBarTitleDisplayMode(.inline)
                 .onAppear(){
                        self.taskViewModel.fetchData()
                        
                }
                
            }
        
    }
    
}
    
    
    

//
//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView()
//    }
//}
