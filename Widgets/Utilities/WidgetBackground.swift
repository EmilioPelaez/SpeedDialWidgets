//
//  WidgetBackground.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 2/9/23.
//

import SwiftUI

extension View {
	@ViewBuilder
	func widgetBackground(_ backgroundContent: () -> some View) -> some View {
			if #available(iOSApplicationExtension 17.0, *) {
				containerBackground(for: .widget) {
							backgroundContent()
					}
			} else {
				background {
					backgroundContent()
				}
			}
	}
}
