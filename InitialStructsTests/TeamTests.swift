//
//  TeamTests.swift
//  InitialStructsTests
//
//  Created by Viraj Puri on 12/3/21.
//

import XCTest
@testable import InitialStructs
import SwiftUI
import FirebaseFirestore

class TeamTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
       var team = Team()
        XCTAssertNotNil(team)
        XCTAssertEqual(team.currentPunishment,"")
        XCTAssertEqual(team.currentReward,"")
        team.setCurrentPunishment(newPunishment: "Finish the project")
        team.setCurrentReward(newReward: "$1000")
        XCTAssertEqual(team.currentPunishment,"Finish the project")
        XCTAssertEqual(team.currentReward,"$1000")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
