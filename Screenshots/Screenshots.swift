//
//  Screenshots.swift
//  Screenshots
//
//  Created by Emilio Peláez on 19/04/22.
//

import XCTest

class Screenshots: XCTestCase {
	func testExample() throws {
		
		let app = XCUIApplication(bundleIdentifier: "com.emiliopelaez.WidgetPreview")
		setupSnapshot(app)
		app.launch()
		
		snapshot("0_Widgets")
	}
}
