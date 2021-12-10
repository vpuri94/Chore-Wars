//
//  ToDoRow.swift
//  InitialStructs
//
//  Created by Sihan Wu on 12/9/21.
//

import SwiftUI

struct ToDoRow: View {
    @State var task: Task
    @ObservedObject private var taskViewModel = TaskViewModel()
    @State var isChecked:Bool = false
    
    func complete(){
        taskViewModel.completeTask(taskId: task.id)
        task.completed = true
    }
    
    var body: some View {
        let image = Image("outdoor")
        Button(action: complete){
            HStack {
                Spacer()
                Image(String(task.category.lowercased()))
                    .padding()
                Spacer()
                VStack (alignment:.leading, spacing: 2){
                    Text(task.name)
                        .font(.custom("Montserrat-SemiBold",size: 18))
                    Text("Due \(task.getDate())")
                        .font(.custom("Montserrat-Light",size: 15))
                }
                Spacer()
                VStack (alignment:.center) {
                    Text("Complete")
                        .font(.custom("Montserrat-Bold",size: 11))
                        .foregroundColor(Color(UIColor.turquoise))
                    Image(task.completed ? "check-square": "empty-square")
                        .scaledToFit()
                        .frame(width: 46, height: 46)
                    Text("\(task.points) pts")
                        .font(.custom("Montserrat-Regular",size: 15))
                        .foregroundColor(Color(UIColor.turquoise))
                }
                Spacer()
            }
        }
        
    }
}

//struct ToDoRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoRow()
//    }
//}
