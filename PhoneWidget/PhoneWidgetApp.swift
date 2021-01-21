//
//  PhoneWidgetApp.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

@main
struct PhoneWidgetApp: App {
	let persistenceController = PersistenceController.shared
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
		}
	}
}
