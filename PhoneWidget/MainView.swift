//
//  MainView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import Contacts

struct MainView: View {
	let store = CNContactStore()
	
	@Environment(\.scenePhase) private var scenePhase
	@State var authorizationFailed = false
	@State var showCallMessage: Bool =  false
	
	var body: some View {
		Group {
			if showCallMessage {
				AlertMessageView()
					.colorScheme(.dark)
					.onTapGesture {
						self.showCallMessage = false
					}
			} else {
				Text("Hello")
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
		.onAppear {
			switch CNContactStore.authorizationStatus(for: .contacts) {
			case .notDetermined:
				store.requestAccess(for: .contacts) { success, _ in
					if !success {
						self.authorizationFailed = true
					}
				}
			case .denied, .restricted:
				DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
					self.authorizationFailed = true
				}
			case _: break
			}
		}
		.alert(isPresented: $authorizationFailed) {
			Alert(title: Text("Contact Access Denied"),
						message: Text("You'll need to grant contacts permissions to use this app. You can do this from settings."),
						primaryButton: .cancel(Text("Ok")),
						secondaryButton: .default(Text("Open Settings"), action: self.openSettings))
		}
	}
	
	func openSettings() {
		guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
		UIApplication.shared.open(url)
	}
	
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(authorizationFailed: false)
	}
}
