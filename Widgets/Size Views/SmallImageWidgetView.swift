//
//  SmallImageWidgetView.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

struct SmallImageWidgetView : View {
	var entry: WidgetEntry
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
			VStack(spacing: 0) {
				HStack {
					ZStack {
						Color.white
							.opacity(0.25)
						Image(systemName: "person.fill")
						entry.image?
							.resizable()
							.aspectRatio(contentMode: .fill)
					}
					.frame(width: 36, height: 36)
					.cornerRadius(18)
					Spacer()
				}
				HStack {
					Text(entry.name)
						.lineLimit(2)
						.font(.system(size: 25, weight: .semibold, design: .default))
					Spacer()
				}
				HStack(spacing: 4) {
					entry.connection.image
					Text(entry.connection.name)
						.font(.system(size: 15, weight: .bold, design: .default))
					Spacer()
				}
				.opacity(0.5)
			}
			.padding()
			.foregroundColor(.white)
		}
	}
}

struct SmallImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		SmallImageWidgetView(entry: .empty)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
		
		SmallImageWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
