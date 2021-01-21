//
//  WidgetProvider.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct WidgetProvider: IntentTimelineProvider {
	func placeholder(in context: Context) -> WidgetEntry {
		.example
	}
	
	func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
		guard let contact = configuration.contact, let address = configuration.address else {
			let entry = WidgetEntry.example
			return completion(entry)
		}
		
		let entry = WidgetEntry(date: Date(),
											name: contact.displayString,
											image: nil,
											connection: configuration.connection,
											background: Background.all[configuration.color.rawValue])
		completion(entry)
	}
	
	func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> ()) {
		getSnapshot(for: configuration, in: context) {
			let timeline = Timeline(entries: [$0], policy: .never)
			completion(timeline)
		}
	}
}
