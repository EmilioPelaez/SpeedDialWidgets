//
//  LockScreenWidget.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/08/22.
//

import WidgetKit
import SwiftUI
import Intents

@available(iOS 16.0, *)
@available(iOSApplicationExtension 16.0, *)
struct LockScreenWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: SimpleConfigurationIntent.self, provider: LockScreenWidgetProvider(imageSize: 200)) { entry in
			LockScreenWidgetView(entry: entry)
		}
		.configurationDisplayName("Contact Widget")
		.description("Add a contact to your Lock Screen to reach them quickly.")
		.supportedFamilies([.accessoryCircular])
	}
}
