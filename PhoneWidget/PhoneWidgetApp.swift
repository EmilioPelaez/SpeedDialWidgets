//
//  PhoneWidgetApp.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

@main
struct PhoneWidgetApp: App {
	@Environment(\.scenePhase) private var scenePhase
	
	@State var showCallMessage: Bool =  false
	
	var body: some Scene {
		WindowGroup {
			Group {
				if showCallMessage {
					AlertMessageView()
						.colorScheme(.dark)
						.onTapGesture {
							self.showCallMessage = false
						}
				} else {
					ContentView()
				}
			}
			.onOpenURL(perform: { url in
				print(url)
				UIApplication.shared.open(url)
				self.showCallMessage = true
			})
			.onChange(of: scenePhase, perform: { value in
				print(value)
				guard value == .active else { return }
				self.showCallMessage = false
			})
		}
	}
}
