//
//  WidgetPreview.swift
//  WidgetPreview
//
//  Created by Emilio Peláez on 19/04/22.
//

import SwiftUI

struct WidgetPreview: View {
	var body: some View {
		VStack(spacing: 16) {
			HStack(spacing: 16) {
				CircleImageWidgetView(entry: .placeholder)
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				Spacer()
					.frame(maxWidth: .infinity)
			}
			HStack(spacing: 16) {
				Spacer()
					.frame(maxWidth: .infinity)
				FullImageWidgetView(entry: .demo["Demo1"]!)
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: 20))
			}
			HStack(spacing: 16) {
				CircleImageWidgetView(entry: .demo["Demo5"]!)
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				Spacer()
					.frame(maxWidth: .infinity)
			}
			Spacer()
		}
		.padding()
		.background {
			Image("Widget Background")
				.resizable()
				.aspectRatio(1, contentMode: .fill)
				.ignoresSafeArea()
		}
	}
}

struct WidgetPreview_Previews: PreviewProvider {
	static var previews: some View {
		WidgetPreview()
	}
}
