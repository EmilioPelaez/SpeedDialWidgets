//
//  WidgetProvider.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit
import Contacts

struct WidgetProvider: IntentTimelineProvider {
	let imageSize: CGFloat
	
	func placeholder(in context: Context) -> WidgetEntry {
		.placeholderSmall
	}
	
	func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
		if let altName = configuration.altName, let demo = WidgetEntry.demo[altName] {
			return completion(demo)
		}
		guard !context.isPreview && configuration.altName != "Demo" else {
			return completion(.placeholderSmall)
		}
		guard let contact = configuration.contact, let contactId = contact.identifier else {
			return completion(WidgetEntry.emptyEntryWithConfiguration(.missingContact))
		}
		guard let address = configuration.address?.identifier else {
			return completion(WidgetEntry.emptyEntryWithConfiguration(.missingAddress))
		}
		let processedAddress = processedString(address, for: configuration.connection)
		let entry = WidgetEntry(date: Date(),
														name: configuration.altName?.nilOnEmpty ?? contact.displayString,
														image: CNContact.imageForContactId(contactId, imageSize: imageSize, squared: configuration.imageSize == .small),
														connection: configuration.connection,
														background: Background.all[configuration.color.rawValue],
														urlString: [configuration.connection.scheme, processedAddress].joined(),
														size: configuration.imageSize,
														configurationLevel: .complete)
		completion(entry)
	}
	
	func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> ()) {
		getSnapshot(for: configuration, in: context) {
			let timeline = Timeline(entries: [$0], policy: .never)
			completion(timeline)
		}
	}
	
	private func processedString(_ string: String, for connection: Connection) -> String {
		guard connection.requiresOnlyNumbers else { return string }
		return string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
	}
}
