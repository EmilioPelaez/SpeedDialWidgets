//
//  LockScreenWidgetView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/08/22.
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 15.0, *)
struct LockScreenWidgetView: View {
	var entry: WidgetEntry
	
	var body: some View {
		ZStack {
			if entry.configurationLevel != .complete {
				Rectangle()
					.foregroundStyle(.background)
				Image(systemName: "person.crop.circle.badge.exclamationmark")
					.font(.title)
			} else if let image = entry.image {
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
			} else {
				Rectangle()
					.foregroundStyle(.background)
				Text(entry.initials)
					.font(.title)
			}
		}
		.clipShape(Circle())
		.widgetURL(URL(string: entry.urlString))
	}
}

@available(iOSApplicationExtension 15.0, *)
struct HomeScreenWidgetView_Previews: PreviewProvider {
	static var previews: some View {
		LockScreenWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
