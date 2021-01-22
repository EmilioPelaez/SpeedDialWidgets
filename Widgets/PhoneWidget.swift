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
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: WidgetProvider(imageSize: 200), content: WidgetView.init)
			.configurationDisplayName("Contact Widget")
			.description("")
			.supportedFamilies([.systemSmall])
	}
}
