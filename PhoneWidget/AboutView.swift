//
//  AboutView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 24/01/21.
//

import SwiftUI

struct AboutView: View {
	@Binding var showAbout: Bool
	
	struct SocialButton: View {
		let action: () -> ()
		let imageName: String
		let imageSize: CGFloat
		let color: Color
		let caption: String
		
		var body: some View {
			VStack(spacing: 3) {
				Button(action: action) {
					Image(systemName: imageName)
						.font(.system(size: imageSize))
						.frame(width: 40, height: 40)
						.foregroundColor(.white)
						.background(color)
						.clipShape(Circle())
				}
				Text(caption)
					.font(.caption2)
					.foregroundColor(.primary)
			}
		}
	}
	
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
				VStack(spacing: 20) {
					VStack {
						Text("Created by")
							.font(.callout)
						Text("Emilio Peláez")
							.font(.title)
					}
					HStack(spacing: 20) {
						SocialButton(action: webAction,
												 imageName: "globe",
												 imageSize: 30,
												 color: .blue,
												 caption: "Website")
						SocialButton(action: twitterAction,
												 imageName: "message.fill",
												 imageSize: 20,
												 color: Color(red: 0.11, green: 0.63, blue: 0.95),
												 caption: "Twitter")
						SocialButton(action: appsAction,
												 imageName: "apps.iphone",
												 imageSize: 26,
												 color: .black,
												 caption: "Apps")
					}
				}
			}
			ZStack(alignment: .topLeading) {
				Color.clear
				Button {
					self.showAbout = false
				} label: {
					Image(systemName: "xmark")
						.foregroundColor(Color(.systemGray))
						.font(.system(size: 15, weight: .bold))
						.frame(width: 30, height: 30)
						.background(
							Circle().fill(Color(.systemGray4).opacity(0.5))
						)
						.padding(7)
				}
				.padding(7)
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
	
	func appsAction() {
		guard let url = URL(string: "https://apps.apple.com/us/developer/emilio-pelaez/id408763858") else { return }
		UIApplication.shared.open(url, options: [:])
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView(showAbout: .constant(true))
	}
}
