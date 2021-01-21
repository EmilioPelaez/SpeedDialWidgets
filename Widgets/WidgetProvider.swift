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
	func placeholder(in context: Context) -> WidgetEntry {
		.example
	}
	
	func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
		guard let contact = configuration.contact, let contactId = contact.identifier, let address = configuration.address else {
			let entry = WidgetEntry.example
			return completion(entry)
		}
		
		let entry = WidgetEntry(date: Date(),
											name: contact.displayString,
											image: imageForContactId(contactId),
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
	
	private func imageForContactId(_ identifier: String) -> Image? {
		do {
			let keys = [CNContactImageDataKey].map { $0 as CNKeyDescriptor }
			let predicate: NSPredicate = CNContact.predicateForContacts(withIdentifiers: [identifier])
			let contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: keys)
			guard let contact = contacts.first else { return nil }
			print(contact.imageData)
			return contact.imageData
				.flatMap(UIImage.init)?
				.resized(toFit: CGSize(side: 200))
				.map(Image.init)
		} catch {
			print(error)
			return nil
		}
	}
}
