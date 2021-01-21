//
//  SmallImageWidget.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct SmallImageWidget: Widget {
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: String(describing: type(of: self)), intent: ConfigurationIntent.self, provider: Provider(), content: WidgetView.init)
		.configurationDisplayName("My Widget")
		.description("This is an example widget.")
	}
}

extension SmallImageWidget {
	struct Entry: TimelineEntry {
		let date: Date
		let name: String
		let image: Image?
		let connection: Connection
		let background: Background
		
		static let example = Entry(date: Date(),
															 name: "Emilio Peláez",
															 image: Image("Avatar"),
															 connection: .phone,
															 background: Background.all[7])
	}
}

extension SmallImageWidget {
	struct Provider: IntentTimelineProvider {
		func placeholder(in context: Context) -> Entry {
			.example
		}
		
		func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Entry) -> ()) {
			guard let contact = configuration.contact, let address = configuration.address else {
				let entry = Entry.example
				return completion(entry)
			}
			
			let entry = Entry(date: Date(),
												name: contact.displayString,
												image: nil,
												connection: configuration.connection,
												background: Background.all[configuration.color.rawValue])
			completion(entry)
		}
		
		func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
			getSnapshot(for: configuration, in: context) {
				let timeline = Timeline(entries: [$0], policy: .never)
				completion(timeline)
			}
		}
	}
}
