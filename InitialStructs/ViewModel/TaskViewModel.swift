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
                let id  = data["id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let points = data["points"] as? Int ?? 0
                let dueDate = data["dueDate"] as? Date ?? NSDate.now
                let claimed = data["claimed"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                let task  = Task(id: id, name: name, points: points, dueDate: dueDate, claimed: claimed, category: category )
                return task
            }
        }
    }
    
    func addData(name:String, points: String, dueDate: Date, category: String){
        let points = Int(points) ?? 0
        var task = Task(name: name, points: points, dueDate: dueDate, category: category)
        let doc = db.collection("Task").addDocument(data: task.taskDict())
        let docID: String = doc.documentID
        task.id = docID
        db.collection("Task").document(doc.documentID).updateData(["id": docID])
    }
    
    func updateData(taskId: String, userID: String) {
        let id = db.collection("Task").document(taskId).documentID
        db.collection("Task").document(id).updateData(["claimed": userID])
    }
}

