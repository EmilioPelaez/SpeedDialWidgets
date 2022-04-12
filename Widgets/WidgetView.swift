//
//  WidgetView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI
import WidgetKit

struct WidgetView : View {
	var entry: WidgetEntry
	
	var body: some View {
		if entry.configurationLevel != .complete {
			ConfigurationView(configurationLevel: entry.configurationLevel)
		} else {
			Group {
				switch entry.size {
				case .small: CircleImageWidgetView(entry: entry)
				case .medium: RectangleImageWidgetView(entry: entry)
				case .large: FullImageWidgetView(entry: entry)
				case _: RectangleImageWidgetView(entry: entry)
				}
			}
			.widgetURL(URL(string: entry.urlString))
		}
	}
}

struct WidgetView_Previews: PreviewProvider {
	static var previews: some View {
		WidgetView(entry: .placeholderSmall)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		WidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		WidgetView(entry: .placeholderLarge)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
