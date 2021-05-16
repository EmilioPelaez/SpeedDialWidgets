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
			Image("Messages")
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
