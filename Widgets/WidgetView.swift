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
		if entry.isEmpty {
			ConfigurationView()
		} else {
			switch entry.size {
			case .small: SmallImageWidgetView(entry: entry)
			case .medium: MediumImageWidgetView(entry: entry)
			case .large: LargeImageWidgetView(entry: entry)
			case _: MediumImageWidgetView(entry: entry)
			}
		}
	}
}

struct WidgetView_Previews: PreviewProvider {
	static var previews: some View {
		WidgetView(entry: .empty)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		WidgetView(entry: .placeholderSmall)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		WidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		WidgetView(entry: .placeholderLarge)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
