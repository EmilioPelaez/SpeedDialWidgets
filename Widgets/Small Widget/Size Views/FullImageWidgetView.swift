//
//  FullImageWidgetView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct FullImageWidgetView : View {
	var entry: WidgetEntry
	
	var body: some View {
		ZStack(alignment: .bottomLeading) {
			LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
				.overlay(
					entry.image?
						.resizable()
						.aspectRatio(contentMode: .fill)
				)
				VStack(alignment: .leading, spacing: 2) {
					Text(entry.name)
						.lineLimit(2)
						.minimumScaleFactor(0.5)
						.font(.headline)
					HStack(spacing: 4) {
						entry.connection.image
						Text(entry.connection.name)
							.lineLimit(1)
					}
					.font(.footnote.bold())
					.opacity(0.5)
				}
				.frame(maxWidth: .infinity, alignment: .bottomLeading)
				.padding(.horizontal, 8)
				.padding(.bottom, 8)
				.padding(.top, 30)
				.foregroundColor(.white)
				.background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
		}
	}
}

struct LargeImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		FullImageWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
