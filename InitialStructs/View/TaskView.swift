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
    @ObservedObject private var taskViewModel = TaskViewModel()
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Claimed").padding()
                    Text("Unclaimed").padding()
                }
            
            VStack{
                List(taskViewModel.tasks, id: \.id){ task in
                    Text(task.name).padding()
                    Text(String(task.points)).frame( alignment: .trailing)
                    
                }
            }.navigationBarTitle("Tasks")
            .onAppear(){
                self.taskViewModel.fetchData()
                var testingFilter = self.taskViewModel.tasks.filter{$0.isNotClaimed()}
                print("here")
                print(testingFilter)
                print("here")
            }
        }
        
        }
    }
}
    
    
    


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
