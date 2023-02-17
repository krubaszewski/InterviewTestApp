//
//  MainScreen.swift
//  InterviewTestAppUITests
//
//  Created by Kacper Rubaszewski on 20/12/2022.
//

import Foundation
import XCTest

class DataSetup{
    
    // MARK: - Buttons
    struct Buttons{
        let validateButton: XCUIElement
        let nextScreenButton: XCUIElement
        let backButton: XCUIElement
    }
    
    static let buttons = Buttons(
        validateButton: XCUIApplication().buttons["Validate"],
        nextScreenButton: XCUIApplication().buttons["Show next screen"],
        backButton: XCUIApplication().buttons["Data Entry View"]
    )
    
    // MARK: - Buttons
    //    let validateButton = XCUIApplication().buttons["Validate"]
    //    let nextScreenButton = XCUIApplication().buttons["Show next screen"]
    
    // MARK: - Text Fields or text
    let textField = XCUIApplication().textFields["Text_Field"]
    let nonNumValresults = XCUIApplication().staticTexts["Text cannot be converted to decimal number"]
    let numValResults = XCUIApplication().staticTexts
    let labelMainScreen = XCUIApplication().staticTexts["Label"]
    
    func Value(_ value: String){
        let fieldTextValue = textField
        fieldTextValue.typeText(value)
    }
    
    func doubleValue(_ cos: String) -> String{
       return "Entered value: \(Double(cos) ?? 0)"
    }
    
    func nonNumeValError() -> String{
       return "Text cannot be converted to decimal number"
    }
    
    static func TestValue(_ value: String){
        let data = DataSetup()
        data.textField.tap()
        data.Value(value)
        DataSetup.buttons.validateButton.tap()
    }
}
