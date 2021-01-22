//
//  LargeImageWidgetView.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

extension LargeImageWidget {
	struct WidgetView : View {
		var entry: WidgetEntry
		
		var body: some View {
			ZStack {
				LinearGradient(gradient: entry.background.gradient, startPoint: .top, endPoint: .bottom)
					.overlay(
						entry.image?
							.resizable()
							.aspectRatio(contentMode: .fill)
					)
				VStack {
					Spacer()
					VStack(spacing: 2) {
						HStack {
							Text(entry.name)
								.lineLimit(1)
								.font(.system(size: 18, weight: .semibold, design: .default))
							Spacer()
						}
						HStack(spacing: 4) {
							entry.connection.image
								.font(.system(size: 12, weight: .bold, design: .default))
							Text(entry.connection.name)
								.font(.system(size: 12, weight: .bold, design: .default))
							Spacer()
						}
					}
					.padding(.horizontal)
					.padding(.top, 35)
					.padding(.bottom, 10)
					.foregroundColor(.white)
					.background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
				}
			}
			.widgetURL(URL(string: entry.urlString))
		}
	}
}



struct LargeImageWidget_Previews: PreviewProvider {
	static var previews: some View {
		LargeImageWidget.WidgetView(entry: .example)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
