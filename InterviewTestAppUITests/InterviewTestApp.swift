//
//  InterviewTestApp.swift
//  InterviewTestAppUITests
//
//  Created by Scott Esseen on 06/07/2022.
//

import XCTest
import Foundation

@testable import InterviewTestApp

class InterviewTestApp: XCTestCase {
    
    private var app: XCUIApplication!
    private var sut: NextViewController!
    
    //Run the cunch of code before test starts
    override func setUpWithError() throws {
        continueAfterFailure = false //do not run in case of any error
        app = XCUIApplication() //run fresh app every time
        app.launch()
    }
    
    //Run the cunch of code after tests are done
    override func tearDownWithError() throws {
        app = nil //terminate app
    }
    
    func test_Non_Numerical_Value() throws{
       
        // UI tests must launch the application that they test.
        let value = "Anna"
        let data = DataSetup()
        DataSetup.buttons.nextScreenButton.tap()
        DataSetup.TestValue(value)

        XCTAssertEqual(data.nonNumValresults.label, data.nonNumeValError())
        XCTAssert(!DataSetup.buttons.nextScreenButton.isEnabled, "Wrong button state")

        //XCTAssert(mainScreen.results[mainScreen.doubleValue(value)].exists, "Typed value is not double. Value is: \(type(of: value))")
        // MainScreen.buttons.nextScreenButton.tap()
        //XCTAssert(mainScreen.nextScreenButton.isEnabled, "nie dziala przycisk")
    }
    
    func test_Numerical_Value() throws{
       
        // UI tests must launch the application that they test.
        let value = "56"
        let data = DataSetup()
        DataSetup.buttons.nextScreenButton.tap()
        DataSetup.TestValue(value)

        XCTAssert(data.numValResults[data.doubleValue(value)].exists, "Typed value is not double. Value is: \(type(of: value))")
        XCTAssert(DataSetup.buttons.nextScreenButton.isEnabled, "The button has wrong state")

        DataSetup.buttons.nextScreenButton.tap()
        
        XCTAssert (data.numValResults["\(Double(value) ?? 0)"].exists, "\(Double(value) ?? 0)")
        
        DataSetup.buttons.backButton.tap()
        
        XCTAssertEqual(data.textField.value as! String, "")
        XCTAssertEqual(data.labelMainScreen.exists, false)
        XCTAssert(!DataSetup.buttons.nextScreenButton.isEnabled, "Wrong button state")
    }
    
    func test_Coma_Value() throws{
        // UI tests must launch the application that they test.
        let value = ",56"
        let data = DataSetup()
        DataSetup.buttons.nextScreenButton.tap()
        DataSetup.TestValue(value)

        XCTAssertEqual(data.nonNumValresults.label, data.nonNumeValError())
        XCTAssert(!DataSetup.buttons.nextScreenButton.isEnabled, "The button has wrong state")
    }
    
    func test_Dot_Value() throws{
        // UI tests must launch the application that they test.
        let value = ".897"
        let data = DataSetup()
        DataSetup.buttons.nextScreenButton.tap()
        DataSetup.TestValue(value)

        XCTAssert(data.numValResults[data.doubleValue(value)].exists, "Typed value is not double. Value is: \(type(of: value))")
        XCTAssert(DataSetup.buttons.nextScreenButton.isEnabled, "The button has wrong state")

        DataSetup.buttons.nextScreenButton.tap()
        
        XCTAssert(data.numValResults["\(Double(value) ?? 0)"].exists, "\(Double(value) ?? 0)")
    
        DataSetup.buttons.backButton.swipeRight()
        
        XCTAssertEqual(data.textField.value as! String, "")
        XCTAssertEqual(data.labelMainScreen.exists, false)
        XCTAssert(!DataSetup.buttons.nextScreenButton.isEnabled, "Wrong button state")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
