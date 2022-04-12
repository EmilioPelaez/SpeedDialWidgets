//
//  MediumImageWidgetView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct MediumImageWidgetView : View {
	var entry: WidgetEntry
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
			VStack(alignment: .leading, spacing: 4) {
				Group {
					if let image = entry.image {
						ImageFill(image: image, contentMode: .fill)
					} else {
						EmptyAvatar(size: 34)
					}
				}
				.clipShape(ContainerRelativeShape())
				VStack(alignment: .leading, spacing: 0) {
					Text(entry.name)
						.lineLimit(1)
						.font(.headline)
						.minimumScaleFactor(0.5)
					HStack(spacing: 4) {
						entry.connection.image
						Text(entry.connection.name)
							.lineLimit(1)
					}
					.font(.footnote.bold())
					.opacity(0.5)
					
				}
			}
			.padding()
			.foregroundColor(.white)
		}
	}
}

struct MediumImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		MediumImageWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
