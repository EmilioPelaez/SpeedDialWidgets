//
//  CallAlertView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI

struct CallAlertView: View {
	var body: some View {
		ZStack {
			Color.clear
			VStack(spacing: 30) {
				Color.clear
				Image("Call")
				VStack(spacing: 10) {
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
		CallAlertView()
	}
}
