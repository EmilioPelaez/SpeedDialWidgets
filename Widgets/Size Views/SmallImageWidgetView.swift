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
			VStack(spacing: 4) {
				HStack {
					if let image = entry.image {
						image.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(Circle())
					} else {
						Color.clear
					}
					Spacer()
				}
				VStack(spacing: 0) {
					HStack {
						Text(entry.name)
							.lineLimit(2)
							.layoutPriority(1)
							.font(.system(size: 25, weight: .semibold, design: .default))
						Spacer()
					}
					HStack(spacing: 4) {
						entry.connection.image
						Text(entry.connection.name)
							.lineLimit(1)
						Spacer()
					}
					.font(.system(size: 14, weight: .bold, design: .default))
					.opacity(0.5)
				}
				.layoutPriority(1)
			}
			.padding()
			.foregroundColor(.white)
		}
	}
}

struct SmallImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		SmallImageWidgetView(entry: .placeholder)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
