//
//  PhoneWidgetApp.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

@main
struct PhoneWidgetApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
				.onOpenURL(perform: { url in
					print(url)
					UIApplication.shared.open(url)
				})
		}
	}
}
