//
//  WidgetEntry.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct WidgetEntry: TimelineEntry {
	let date: Date
	let name: String
	let image: Image?
	let connection: Connection
	let background: Background
	let urlString: String
	let isEmpty: Bool
	let size: ImageSize
	
	static let placeholderSmall = WidgetEntry(date: Date(),
																						name: "Emilio Peláez",
																						image: Image("Avatar"),
																						connection: .phone,
																						background: Background.all[7],
																						urlString: "example",
																						isEmpty: false,
																						size: .small)
	
	static let placeholder = WidgetEntry(date: Date(),
																			 name: "Emilio P.",
																			 image: Image("Avatar"),
																			 connection: .phone,
																			 background: Background.all[7],
																			 urlString: "example",
																			 isEmpty: false,
																			 size: .medium)
	
	static let placeholderLarge = WidgetEntry(date: Date(),
																						name: "Emilio Peláez",
																						image: Image("Avatar"),
																						connection: .phone,
																						background: Background.all[7],
																						urlString: "example",
																						isEmpty: false,
																						size: .large)
	
	static let empty = WidgetEntry(date: Date(),
																 name: "Emilio Peláez",
																 image: Image("Avatar"),
																 connection: .phone,
																 background: Background.all[7],
																 urlString: "example",
																 isEmpty: true,
																 size: .medium)
	
	static let demo: [String: WidgetEntry] = [
		"Demo0": WidgetEntry(date: Date(),
										name: "Mathilda",
										image: Image("image-0"),
										connection: .phone,
										background: Background.all[1],
										urlString: "example",
										isEmpty: false,
										size: .medium),
		"Demo1": WidgetEntry(date: Date(),
										name: "William Carr",
										image: Image("image-1"),
										connection: .faceTimeAudio,
										background: Background.all[2],
										urlString: "example",
										isEmpty: false,
										size: .large),
		"Demo2": WidgetEntry(date: Date(),
										name: "Nicholas Wheeler",
										image: Image("image-2"),
										connection: .phone,
										background: Background.all[3],
										urlString: "example",
										isEmpty: false,
										size: .medium),
		"Demo3": WidgetEntry(date: Date(),
										name: "Keri McNamara",
										image: Image("image-3"),
										connection: .phone,
										background: Background.all[4],
										urlString: "example",
										isEmpty: false,
										size: .small),
		"Demo4": WidgetEntry(date: Date(),
										name: "Fabien Beaumont",
										image: Image("image-4"),
										connection: .phone,
										background: Background.all[5],
										urlString: "example",
										isEmpty: false,
										size: .medium),
		"Demo5": WidgetEntry(date: Date(),
										name: "Jessie Sykes",
										image: Image("image-5"),
										connection: .faceTime,
										background: Background.all[6],
										urlString: "example",
										isEmpty: false,
										size: .small)
	]
}
