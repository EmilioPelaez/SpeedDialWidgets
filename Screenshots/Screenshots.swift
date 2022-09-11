//
//  Screenshots.swift
//  Screenshots
//
//  Created by Emilio Peláez on 19/04/22.
//

import XCTest

class Screenshots: XCTestCase {
	func testLockScreen() throws {
		let app = XCUIApplication(bundleIdentifier: "com.emiliopelaez.WidgetPreview")
		app.launchArguments = ["LockScreenWidgets"]
		setupSnapshot(app)
		app.launch()
		
		snapshot("0_LockScreen")
	}
	
	
	func testWidgets() throws {
		let app = XCUIApplication(bundleIdentifier: "com.emiliopelaez.WidgetPreview")
		setupSnapshot(app)
		app.launch()
		
		snapshot("1_Widgets")
	}
	
}
