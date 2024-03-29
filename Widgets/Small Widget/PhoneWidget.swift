//
//  PhoneWidget.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 22/01/21.
//

import WidgetKit
import SwiftUI
import Intents

struct PhoneWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: WidgetProvider(imageSize: 600), content: WidgetView.init)
			.configurationDisplayName("Contact Widget")
			.description("Add a contact to your Home or Lock Screen to reach them quickly.")
			.supportedFamilies([.systemSmall])
			.contentMarginsDisabled()
	}
}
