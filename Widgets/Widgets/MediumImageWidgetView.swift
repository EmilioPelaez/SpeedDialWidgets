//
//  MediumImageWidgetView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

extension MediumImageWidget {
	struct WidgetView : View {
		var entry: WidgetEntry
		
		var body: some View {
			ZStack {
				LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
				VStack(spacing: 5) {
					HStack {
						ZStack {
							Color.white
								.opacity(0.25)
							Image(systemName: "person.fill").font(.system(size: 34))
							entry.image?
								.resizable()
								.aspectRatio(contentMode: .fill)
						}
						.frame(width: 64, height: 64)
						.cornerRadius(32)
						Spacer()
					}
					VStack(spacing: 1) {
						HStack {
							Text(entry.name)
								.lineLimit(1)
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
				}
				.padding(.horizontal)
				.foregroundColor(.white)
			}
			.widgetURL(URL(string: entry.urlString))
		}
	}
}



struct MediumImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		MediumImageWidget.WidgetView(entry: .example)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
