//
//  AppSwitchingAlertView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 31/01/21.
//

import SwiftUI

struct AppSwitchingAlertView: View {
	var body: some View {
		ZStack {
			Color.clear
			VStack(spacing: 10) {
				ZStack {
					VStack(alignment: .trailing) {
						Image("Messages")
							.resizable()
							.aspectRatio(contentMode: .fit)
					}
					.padding()
				}
			}
			.padding()
		}
		.background(
			Color(.systemGroupedBackground).ignoresSafeArea()
		)
	}
}

struct AppSwitchingAlertView_Previews: PreviewProvider {
	static var previews: some View {
		AppSwitchingAlertView()
	}
}
