//
//  AboutView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 24/01/21.
//

import SwiftUI

struct AboutView: View {
	@Binding var showAbout: Bool
	
	var body: some View {
		ZStack {
			Color.clear
			VStack(spacing: 30) {
				ZStack(alignment: .bottom) {
					
					RoundedRectangle(cornerRadius: 20)
						.fill(Color(.red))
						.frame(width: 90, height: 5)
						.padding(.bottom, 15)
						.shadow(color: Color(white: 0, opacity: 1), radius: 5, x: 0, y: 15)
					Image("Icon")
						.resizable()
						.frame(width: 100, height: 100)
						.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
				}
				VStack {
					Text("Created by")
						.font(.callout)
					Text("Emilio Peláez")
						.font(.title)
					HStack(spacing: 20) {
						Button(action: webAction) {
							Image("Globe")
						}
						Button(action: twitterAction) {
							Image("Twitter")
						}
					}
				}
			}
			ZStack(alignment: .topLeading) {
				Color.clear
				Button {
					self.showAbout = false
				} label: {
					Image(systemName: "xmark")
						.foregroundColor(Color(white: 0.5, opacity: 1))
						.font(.headline)
						.padding(8)
						.background(
							Circle().fill(Color(white: 0.85, opacity: 0.5))
						)
						.padding()
				}
			}
			ZStack(alignment: .bottom) {
				Color.clear
				Text("100% free forever. No ads,\nno subscriptions, no limits.")
					.multilineTextAlignment(.center)
					.font(.footnote)
					.padding()
			}
		}
	}
	
	func webAction() {
		guard let url = URL(string: "http://emiliopelaez.me") else { return }
		UIApplication.shared.open(url, options: [:])
	}
	
	func twitterAction() {
		guard let url = URL(string: "http://twitter.com/EmilioPelaez") else { return }
		UIApplication.shared.open(url, options: [:])
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView(showAbout: .constant(true))
	}
}