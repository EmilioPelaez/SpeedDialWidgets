//
//  WidgetEntry.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct WidgetEntry: TimelineEntry {
	enum ConfigurationLevel {
		case complete
		case missingContact
		case missingAddress
	}
	
	let date: Date
	let name: String
	let image: Image?
	let connection: Connection
	let background: Background
	let urlString: String
	let size: ImageSize
	let configurationLevel: ConfigurationLevel
	
	var initials: String {
		name
			.split(separator: " ")
			.compactMap { $0.first }
			.map { String($0) }
			.prefix(2)
			.joined()
			.uppercased()
			.nilOnEmpty
		?? "N/A"
	}
	
	static func emptyEntryWithConfiguration(_ level: ConfigurationLevel) -> WidgetEntry {
		WidgetEntry(date: Date(),
								name: "Emilio Peláez",
								image: nil,
								connection: .phone,
								background: Background.all[7],
								urlString: "example",
								size: .medium,
								configurationLevel: level)
	}
	
	static let placeholderSmall = WidgetEntry(date: Date(),
																						name: "Emilio Peláez",
																						image: Image("Avatar"),
																						connection: .phone,
																						background: Background.all[7],
																						urlString: "example",
																						size: .small,
																						configurationLevel: .complete)
	
	static let placeholderNoImage = WidgetEntry(date: Date(),
																						name: "Emilio Peláez",
																						image: nil,
																						connection: .phone,
																						background: Background.all[7],
																						urlString: "example",
																						size: .small,
																						configurationLevel: .complete)
	
	static let placeholder = WidgetEntry(date: Date(),
																			 name: "Emilio Peláez",
																			 image: Image("Avatar"),
																			 connection: .phone,
																			 background: Background.all[7],
																			 urlString: "example",
																			 size: .medium,
																			 configurationLevel: .complete)
	
	static let placeholderLarge = WidgetEntry(date: Date(),
																						name: "Emilio Peláez",
																						image: Image("Avatar"),
																						connection: .phone,
																						background: Background.all[7],
																						urlString: "example",
																						size: .large,
																						configurationLevel: .complete)
	
	static let demo: [String: WidgetEntry] = [
		"Demo0": WidgetEntry(date: Date(),
												 name: "Mathilda",
												 image: Image("image-0"),
												 connection: .phone,
												 background: Background.all[1],
												 urlString: "example",
												 size: .medium,
												 configurationLevel: .complete),
		"Demo1": WidgetEntry(date: Date(),
												 name: "William Carr",
												 image: Image("image-1"),
												 connection: .whatsapp,
												 background: Background.all[2],
												 urlString: "example",
												 size: .large,
												 configurationLevel: .complete),
		"Demo2": WidgetEntry(date: Date(),
												 name: "Nicholas W.",
												 image: Image("image-2"),
												 connection: .message,
												 background: Background.all[3],
												 urlString: "example",
												 size: .medium,
												 configurationLevel: .complete),
		"Demo3": WidgetEntry(date: Date(),
												 name: "Keri McNamara",
												 image: Image("image-3"),
												 connection: .phone,
												 background: Background.all[4],
												 urlString: "example",
												 size: .small,
												 configurationLevel: .complete),
		"Demo4": WidgetEntry(date: Date(),
												 name: "Fabien Beaumont",
												 image: Image("image-4"),
												 connection: .phone,
												 background: Background.all[5],
												 urlString: "example",
												 size: .medium,
												 configurationLevel: .complete),
		"Demo5": WidgetEntry(date: Date(),
												 name: "Jessie Sykes",
												 image: Image("image-5"),
												 connection: .faceTime,
												 background: Background.all[6],
												 urlString: "example",
												 size: .small,
												 configurationLevel: .complete)
	]
}
