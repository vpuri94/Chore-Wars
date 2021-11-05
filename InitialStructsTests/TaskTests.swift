//
//  TaskTests.swift
//  InitialStructsTests
//
//  Created by M.Talha  Subzwari on 11/5/21.
//


import XCTest
@testable import InitialStructs
import SwiftUI
import FirebaseFirestore

class TaskTests: XCTestCase {
    private var db = Firestore.firestore()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    init(id: String = "", name: String,points: Int,dueDate: Date, claimed: String = "", category: String) {
    @available(iOS 15, *)
    func testExample() throws {
        
        let task  = Task(id: "TestID", name: "Cleaning", points: 200, dueDate: Date.now, claimed: "", category: "Indoor Cleaning")
        let task1  = Task(id: "TestID", name: "Cleaning", points: 200, dueDate: Date.now, claimed: "User1", category: "Indoor Cleaning")
        let dict = task.taskDict()
//        print(tasks)
        
        XCTAssertNotNil(task)
        XCTAssertNotNil(task.taskDict())
//        XCTAssertNotNil(taskViewModelTest.fetchData())
        
        XCTAssertEqual(task.name,"Cleaning")
        XCTAssertEqual(task.points, 200)
        XCTAssertEqual(task.claimed, "")
        XCTAssertEqual(task.getDate(), "05/11/2021")
        XCTAssertEqual(task.isClaimed(), false)
        XCTAssertEqual(task.isNotClaimed(), true)
        XCTAssertEqual(dict["name"] as! String, "Cleaning")
//        XCTAssertEqual(taskViewModelTest.fetchData(), 6)
//        XCTAssertEqual(Mirror(reflecting: taskViewModelTest.fetchData()).children.count, 6)
       
        
        
        XCTAssertEqual(task1.isClaimed(), true)
        XCTAssertEqual(task1.isNotClaimed(), false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
