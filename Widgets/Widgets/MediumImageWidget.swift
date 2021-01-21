//
//  MediumImageWidget.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import WidgetKit
import SwiftUI
import Intents

struct MediumImageWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: WidgetProvider(), content: WidgetView.init)
			.configurationDisplayName("Medium Image")
			.description("")
			.supportedFamilies([.systemSmall])
	}
}
