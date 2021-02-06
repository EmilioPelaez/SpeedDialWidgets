//
//  TutorialStepView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 24/01/21.
//

import SwiftUI

struct TutorialStepView: View {
	let title: Text
	let content: Text
	let caption: Text?
	let image: Image
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			title
				.font(.title2)
				.fontWeight(.semibold)
			content
				.lineLimit(nil)
				.font(.body)
			if let caption = caption {
				caption
					.lineLimit(nil)
					.font(.caption)
			}
			image.resizable().aspectRatio(contentMode: .fill)
		}
	}
}

struct TutorialStepView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialStepView(title: Text("Step 6"),
										 content: Text("Your widget is ready! Now tap on it whenever you want to make a call!"),
										 caption: nil,
										 image: Image("Step1"))
			.frame(width: 300)
			.padding()
//			.previewLayout(.sizeThatFits)
	}
}
