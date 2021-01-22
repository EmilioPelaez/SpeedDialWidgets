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
	
	static let placeholder = WidgetEntry(date: Date(),
																			 name: "Emilio Peláez",
																			 image: Image("Avatar"),
																			 connection: .phone,
																			 background: Background.all[7],
																			 urlString: "example",
																			 isEmpty: false)
	
	static let empty = WidgetEntry(date: Date(),
																			 name: "Emilio Peláez",
																			 image: Image("Avatar"),
																			 connection: .phone,
																			 background: Background.all[7],
																			 urlString: "example",
																			 isEmpty: true)
}
