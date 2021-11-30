//
//  UserTests.swift
//  InitialStructsTests
//
//  Created by Andrew on 11/5/21.
//

import XCTest
@testable import InitialStructs

class UserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateInstance() {
        let instance = User(id: "asd", firstName: "Andrew", lastName: "Butler", displayName: "Abutler", totalPoints: 200,
                            email: "m.talhasubzwari@gmail.com")
      XCTAssertNotNil(instance)
      XCTAssertEqual(instance.firstName, "Andrew")
      XCTAssertNotEqual(instance.displayName, "dave")
    }
    func testCreateDict() {
        let instance = User(id: "asd", firstName: "Andrew", lastName: "Butler", displayName: "Abutler", totalPoints: 200, email: "m.talhasubzwari@gmail.com")
      let dict = instance.userDict()
      XCTAssertNotNil(dict)
      XCTAssertEqual(dict["firstName"] as! String, "Andrew")
      XCTAssertEqual(dict["lastName"] as! String, "Butler")
      XCTAssertEqual(dict["displayName"] as! String, "Abutler")
    }
}
