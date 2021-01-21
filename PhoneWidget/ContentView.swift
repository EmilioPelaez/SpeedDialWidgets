//
//  ContentView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import Contacts

struct ContentView: View {
	let store = CNContactStore()
	
	@State var authorizationFailed = false
	
	var body: some View {
		Text("Hello")
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
		ContentView(authorizationFailed: false)
	}
}
