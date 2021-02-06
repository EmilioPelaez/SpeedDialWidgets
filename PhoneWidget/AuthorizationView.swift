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
		VStack(spacing: 25) {
			Image("Contacts")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 200)
			switch authorization {
			case .notDetermined:
				AuthorizationContent(title: Text("Welcome!"),
														 content: Text("In order to create widgets for your contacts we'll need access to your address book."),
														 buttonTitle: Text("Grant Access")) {
					store.requestAccess(for: .contacts) { success, _ in
						withAnimation {
							self.authorization = CNContactStore.authorizationStatus(for: .contacts)
						}
					}
				}
			case .denied, .restricted:
				AuthorizationContent(title: Text("Uh oh!"),
														 content: Text("We need access to your contacts in order to create widgets. You can grant access from the settings app!"),
														 buttonTitle: Text("Open Settings")) {
					URL(string: UIApplication.openSettingsURLString).map {
						UIApplication.shared.open($0)
					}
				}
			case _:
				Text("")
			}
		}
	}
	
	struct AuthorizationContent: View {
		let title: Text
		let content: Text
		let buttonTitle: Text
		let buttonAction: () -> Void
		
		var body: some View {
			VStack(alignment: .leading, spacing: 8) {
				title
					.font(.largeTitle)
				content
					.font(.title2)
				Spacer()
					.frame(height: 20)
				HStack {
					Spacer()
					Button(action: buttonAction) {
						buttonTitle
							.font(.headline)
							.foregroundColor(Color(.systemBackground))
							.padding()
							.padding(.horizontal)
							.background(Color.primary)
							.cornerRadius(150)
					}
					Spacer()
				}
			}
			.frame(width: 300)
		}
	}
}

struct AuthorizationView_Previews: PreviewProvider {
	static var previews: some View {
		AuthorizationView(authorization: .constant(.notDetermined))
		
//		AuthorizationView(authorization: .constant(.denied))
	}
}
