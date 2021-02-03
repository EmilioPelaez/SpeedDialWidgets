//
//  ConfigurationView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI
import WidgetKit

struct ConfigurationView: View {
	let configurationLevel: WidgetEntry.ConfigurationLevel
	
	var body: some View {
		ZStack(alignment: .leading) {
			LinearGradient(gradient: configurationLevel.background.gradient, startPoint: .top, endPoint: .bottom)
			VStack(alignment: .leading, spacing: 4) {
				Image(systemName: "hand.tap.fill")
					.font(.system(size: 25))
				Text("Configuration Required!")
					.font(.system(size: 14, weight: .semibold))
					.multilineTextAlignment(.leading)
				Text(configurationLevel.message)
					.font(.system(size: 14, weight: .regular))
					.multilineTextAlignment(.leading)
			}
			.padding()
			.foregroundColor(.white)
		}
	}
}

extension WidgetEntry.ConfigurationLevel {
	var message: String {
		switch self {
		case .complete: return ""
		case .missingContact: return "Select a contact"
		case .missingAddress: return "Select an email or phone."
		}
	}
	
	var background: Background {
		switch self {
		case .complete: return Background.all[0]
		case .missingContact: return Background.all[1]
		case .missingAddress: return Background.all[2]
		}
	}
}

struct ConfigurationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfigurationView(configurationLevel: .missingAddress)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		ConfigurationView(configurationLevel: .missingContact)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
