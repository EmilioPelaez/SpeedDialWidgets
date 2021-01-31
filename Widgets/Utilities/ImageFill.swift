//
//  ImageFill.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 31/01/21.
//

import SwiftUI

struct ImageFill: View {
	let image: Image
	let contentMode: ContentMode
	
	var body: some View {
		Color.clear.overlay(
			image
				.resizable()
				.aspectRatio(contentMode: contentMode)
		)
	}
}
