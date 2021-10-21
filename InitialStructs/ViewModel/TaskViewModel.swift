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
                let task  = Task(name: name, points: points, dueDate: dueDate )
                return task
            }
        }
    }
    
    func addData(name:String, points: String, dueDate: Date){
        let points = Int(points) ?? 0
        let ref: DocumentReference? = nil
        let task = Task(name: name, points: points, dueDate: dueDate)
        db.collection("Task").addDocument(data: task.taskDict())
        {
            err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID )")
            }
    }
}
}

