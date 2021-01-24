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
					Color.black
						.frame(width: 75, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						.padding(.bottom, 2)
						.shadow(color: Color(white: 0, opacity: 0.5), radius: 10, x: 0, y: 2)
					Color.black
						.frame(width: 40, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						.padding(.bottom, 2)
						.shadow(color: Color(white: 0, opacity: 0.5), radius: 10, x: 0, y: 2)
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
