//
//  AlertMessageView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI

struct AlertMessageView: View {
	let index = Int.random(in: 0..<3)
	
	var body: some View {
		ZStack {
			Color.clear
			VStack(spacing: 10) {
				ZStack {
					Color.clear
					VStack(alignment: .trailing) {
						Image(["Call-Couch", "Call-iPhone", "Call-Night"][index])
							.resizable()
							.aspectRatio(contentMode: .fit)
					}
					.padding()
				}
				Text("The system doesn't allow us to make calls automatically.\n(That's a good thing!)")
					.font(.caption)
					.multilineTextAlignment(.center)
					.foregroundColor(Color(.tertiaryLabel))
				Text("Tap Call below to make your call!")
					.font(.headline)
					.multilineTextAlignment(.center)
				Image(systemName: "arrow.down")
					.font(.system(size: 30, weight: .semibold))
				
			}
			.padding()
			.padding(.bottom, 125)
			.background(
				Color(.systemGroupedBackground).ignoresSafeArea()
			)
		}
		
	}
}

struct AlertMessageView_Previews: PreviewProvider {
	static var previews: some View {
		AlertMessageView()
	}
}
