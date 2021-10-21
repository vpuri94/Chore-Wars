//
//  TaskViewModel.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import FirebaseFirestore

class TaskViewModel: ObservableObject{
    @Published var tasks = [Task]()
    private var db = Firestore.firestore()
    func fetchData(){
        db.collection("Task").addSnapshotListener{ (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                return
            }
            self.tasks = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let points = data["points"] as? Int ?? 0
                let dueDate = data["dueDate"] as? Date ?? NSDate.now
                let claimed = data["claimed"]
                let completed = data["completed"]
                let review = data["review"]
                let reviewed = data["reviewed"]
                let task  = Task(name: name, points: points, dueDate: dueDate )
//                print(task)
                print(task.getDate())
                return task
            }
        }
    }
}

