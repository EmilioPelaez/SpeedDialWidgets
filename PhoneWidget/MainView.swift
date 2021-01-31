//
//  MainView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import Contacts

struct MainView: View {
	enum Message {
		case none
		case call
		case message
	}
	
	@Environment(\.scenePhase) private var scenePhase
	@State var authorization = CNContactStore.authorizationStatus(for: .contacts)
	@State var showMessage: Message = .none
	
	var body: some View {
		Group {
			if authorization != .authorized {
				AuthorizationView(authorization: $authorization)
					.transition(.opacity)
			} else if showMessage == .call {
				AlertMessageView()
					.transition(.opacity)
					.colorScheme(.dark)
					.onTapGesture {
						self.showMessage = .none
					}
			} else if showMessage == .message {
				AppSwitchingAlertView()
					.transition(.opacity)
					.colorScheme(.dark)
					.onTapGesture {
						self.showMessage = .none
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
				self.showMessage = .call
			} else if Connection.messaging.contains(where: { $0.matches(url) }) {
				self.showMessage = .message
			}
		})
		.onChange(of: scenePhase, perform: { value in
			print(value)
			self.authorization = CNContactStore.authorizationStatus(for: .contacts)
			if self.showMessage == .call, value == .active {
				withAnimation {
					self.showMessage = .none
				}
			} else if self.showMessage == .message, value == .background {
				self.showMessage = .none
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
