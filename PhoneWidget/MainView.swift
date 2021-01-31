//
//  MainView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import Contacts

struct MainView: View {
	@Environment(\.scenePhase) private var scenePhase
	@State var authorization = CNContactStore.authorizationStatus(for: .contacts)
	@State var showCallMessage: Bool =  false
	
	var body: some View {
		Group {
			if authorization != .authorized {
				AuthorizationView(authorization: $authorization)
					.transition(.opacity)
			} else if showCallMessage {
				AlertMessageView()
					.transition(.opacity)
					.colorScheme(.dark)
					.onTapGesture {
						self.showCallMessage = false
					}
			} else {
				TutorialView()
					.transition(.opacity)
			}
		}
		.onOpenURL(perform: { url in
			print(url)
			UIApplication.shared.open(url)
			if Connection.call.contains(where: { $0.matches(url) }) {
				self.showCallMessage = true
			}
		})
		.onChange(of: scenePhase, perform: { value in
			self.authorization = CNContactStore.authorizationStatus(for: .contacts)
			guard value == .active else { return }
			withAnimation {
				self.showCallMessage = false
			}
		})
	}
	
	func openSettings() {
		guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
		UIApplication.shared.open(url)
	}
	
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
