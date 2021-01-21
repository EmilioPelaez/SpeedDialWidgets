//
//  SmallImageWidget.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import WidgetKit
import SwiftUI
import Intents

struct SmallImageWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: WidgetProvider(), content: WidgetView.init)
			.configurationDisplayName("Small Image")
			.description("")
			.supportedFamilies([.systemSmall])
	}
}
