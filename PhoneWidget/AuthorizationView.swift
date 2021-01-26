//
//  AuthorizationView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 26/01/21.
//

import SwiftUI
import Contacts

struct AuthorizationView: View {
	let store = CNContactStore()
	@Binding var authorization: CNAuthorizationStatus
	
	var body: some View {
		switch authorization {
		case .notDetermined:
			VStack(alignment: .leading, spacing: 8) {
				Text("Welcome!")
					.font(.largeTitle)
				Text("In order to create widgets for your contacts we'll need access to your contacts.")
					.font(.title2)
				Spacer()
					.frame(height: 20)
				HStack {
					Spacer()
					Button {
						store.requestAccess(for: .contacts) { success, _ in
							self.authorization = CNContactStore.authorizationStatus(for: .contacts)
						}
					} label: {
						Text("Grant Access")
							.font(.headline)
							.foregroundColor(Color(.systemBackground))
							.padding()
							.background(Color.primary)
							.cornerRadius(150)
					}
					Spacer()
				}
			}.frame(width: 300)
		case .denied, .restricted:
			VStack(alignment: .leading, spacing: 8) {
				Text("Uh oh!")
					.font(.largeTitle)
				Text("We need access to your contacts in order to create widgets. You can grant access from the settings app!")
					.font(.title2)
				Spacer()
					.frame(height: 20)
				HStack {
					Spacer()
					Button {
						URL(string: UIApplication.openSettingsURLString).map {
							UIApplication.shared.open($0)
						}
					} label: {
						Text("Open Settings")
							.font(.headline)
							.foregroundColor(Color(.systemBackground))
							.padding()
							.background(Color.primary)
							.cornerRadius(150)
					}
					Spacer()
				}
			}.frame(width: 300)
		case _:
			Text("")
		}
	}
}

struct AuthorizationView_Previews: PreviewProvider {
	static var previews: some View {
		AuthorizationView(authorization: .constant(.denied))
		
//		AuthorizationView(authorization: .constant(.denied))
	}
}
