//
//  LockScreenView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/08/22.
//

import SwiftUI

struct LockScreenView: View {
	var body: some View {
		ZStack(alignment: .top) {
			Color.clear
			VStack(spacing: 0) {
				Text("Monday, 22 August")
					.font(.system(size: 21, weight: .bold, design: .default))
					.padding(.bottom, -5)
				Text("7:40")
					.font(.system(size: 92, weight: .medium, design: .default))
					.padding(.bottom, 10)
				HStack(spacing: 25) {
//					LockScreenWidgetView(entry: .placeholderNoImage)
//						.frame(width: 60, height: 60)
					LockScreenWidgetView(entry: .placeholder)
						.frame(width: 60, height: 60)
				}
			}
			.foregroundStyle(.white)
			.padding(.top, 44)
			.grayscale(1)
			.opacity(0.8)
			.blendMode(.screen)
		}
		.background {
			Image("Widget Background")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.ignoresSafeArea()
	}
	}
}

struct LockScreenView_Previews: PreviewProvider {
	static var previews: some View {
		LockScreenView()
	}
}
