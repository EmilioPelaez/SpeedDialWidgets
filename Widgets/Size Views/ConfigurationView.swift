//
//  ConfigurationView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI
import WidgetKit

struct ConfigurationView: View {
	var body: some View {
		ZStack {
			LinearGradient(gradient: Background.all[7].gradient, startPoint: .top, endPoint: .bottom)
			VStack {
				Image(systemName: "hand.tap.fill")
					.font(.system(size: 30))
				Text("Tap and Hold, then select Edit Widget.")
					.font(.system(size: 16, weight: .semibold))
					.multilineTextAlignment(.center)
			}
			.padding()
			.foregroundColor(.white)
		}
	}
}

struct ConfigurationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfigurationView()
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
