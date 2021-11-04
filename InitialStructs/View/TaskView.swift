    //
//  TaskView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import SwiftUI

let testData = [ Task(name: "Cleaning Dishes", points: 50, dueDate: NSDate.now),
                 Task(name: "Gardening", points: 50, dueDate: NSDate.now),
                 Task(name: "Clean the room", points: 50, dueDate: NSDate.now)
]

struct TaskView: View {
    var test = testData
    @State private var selection: String? = "A"
    @ObservedObject private var taskViewModel = TaskViewModel()
//    @ObservedObject private var user = UserViewModel();
    var width  = UIScreen.main.bounds.width
    var body: some View {
            NavigationView {
                VStack{
//
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
                    
                    //MARK: To switch between claimed and unclaimed
                    VStack{
                        HStack{
                            Text("Unclaimed").padding()
                            Text("Claimed").padding()
                    }
                
                    //MARK: Task section.
                        VStack{
                            List(taskViewModel.tasks,id: \.id){ task in
                              TaskRow(task: task)
                                
                            }
                        }
                    }
                }
                .navigationBarTitle("Tasks").font(.custom("Montserrat", size: 20))
                .navigationBarTitleDisplayMode(.inline)
                 .onAppear(){
                        self.taskViewModel.fetchData()
        //                var testingFilter = self.taskViewModel.tasks.filter{$0.isNotClaimed()}
                        print("here")
        //                print(testingFilter)
                        print("here")
                }
        }
    }
}
    
    
    


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
