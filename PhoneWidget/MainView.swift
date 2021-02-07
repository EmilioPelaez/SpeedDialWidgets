//
//  MainView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import Contacts
import StoreKit
import WidgetKit

struct MainView: View {
	enum Message {
		case none
		case call
		case message
	}
	
	@Environment(\.scenePhase) private var scenePhase
	@State var authorization = CNContactStore.authorizationStatus(for: .contacts)
	@State var showMessage: Message = .none
	@State var reviewShown = false
	
	var body: some View {
		Group {
			if authorization != .authorized {
				AuthorizationView(authorization: $authorization)
					.transition(.opacity)
			} else if showMessage == .call {
				CallAlertView()
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
			self.authorization = CNContactStore.authorizationStatus(for: .contacts)
			if self.showMessage == .none, value == .active {
				showRateAlert()
			}
			if self.showMessage == .call, value == .active {
				withAnimation {
					self.showMessage = .none
				}
			} else if self.showMessage == .message, value == .background {
				self.showMessage = .none
			}
		})
	}
	
	func showRateAlert() {
		guard !reviewShown else { return }
		reviewShown = true
		let key = "Review Prompt Shown Date"
		if let date = UserDefaults.standard.object(forKey: key) as? Date, date > Date().addingTimeInterval(60 * 60 * 24 * 7 * -1) {
			return
		}
		WidgetCenter.shared.getCurrentConfigurations { result in
			DispatchQueue.main.async {
				guard case .success(let widgets) = result,
							!widgets.isEmpty,
							let scene = UIApplication.shared.windows.first?.windowScene else { return }
				SKStoreReviewController.requestReview(in: scene)
				UserDefaults.standard.set(Date(), forKey: key)
			}
		}
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
