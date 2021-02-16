//
//  XCUIElement.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 10.02.2021.
//

import Foundation
import XCTest

extension XCUIElement {

    /// Removes any current text in the field before typing in the new value
    ///
    /// - Parameter text: the text to enter into the field
    func clearAndEnterText(_ text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        self.tap()
        let deleteString = stringValue.map { _ in "\u{8}" }.joined()
        self.typeText(deleteString)
        self.typeText(text)
    }

    var hasFocus: Bool {
        (self.value(forKey: "hasKeyboardFocus") as? Bool) ?? false
    }
}
