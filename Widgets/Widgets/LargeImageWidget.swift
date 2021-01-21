//
//  LargeImageWidget.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import WidgetKit
import SwiftUI
import Intents

struct LargeImageWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: WidgetProvider(imageSize: 160), content: WidgetView.init)
			.configurationDisplayName("Large Image")
			.description("")
			.supportedFamilies([.systemSmall])
	}
}
