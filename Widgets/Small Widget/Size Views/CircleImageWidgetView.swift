//
//  CircleImageWidgetView.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct CircleImageWidgetView : View {
	var entry: WidgetEntry
	
	@ViewBuilder
	var imageSection: some View {
		if let image = entry.image {
			ImageFill(image: image, contentMode: .fit)
				.clipShape(Circle())
		} else {
			EmptyAvatar(size: 34)
				.clipShape(Circle())
		}
	}
	
	var body: some View {
		ZStack {
			VStack(spacing: 4) {
				Color.clear
					.overlay(imageSection)
				VStack(spacing: 0) {
					HStack {
						Text(entry.name)
							.lineLimit(1)
							.font(.caption.bold())
					}
					HStack(spacing: 2) {
						entry.connection.image
						Text(entry.connection.name)
							.lineLimit(1)
					}
					.font(.caption2)
					.opacity(0.5)
				}
			}
			.padding()
			.foregroundColor(.white)
		}
		.widgetBackground {
			LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
		}
	}
}

struct SmallImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		CircleImageWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
