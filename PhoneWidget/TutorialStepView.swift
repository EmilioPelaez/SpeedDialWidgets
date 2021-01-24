//
//  TutorialStepView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 24/01/21.
//

import SwiftUI

struct TutorialStepView: View {
	let title: String
	let content: String
	let caption: String?
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.font(.title2)
				.fontWeight(.semibold)
			Text(content)
				.lineLimit(nil)
				.font(.body)
			if let caption = caption {
				Text(caption)
					.lineLimit(nil)
					.font(.caption)
			}
			
			Color.red.frame(height: 100)
		}
	}
}

struct TutorialStepView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialStepView(title: "Step 6",
										 content: "Your widget is ready! Now tap on it whenever you want to make a call!",
										 caption: nil)
			.frame(width: 300)
			.padding()
//			.previewLayout(.sizeThatFits)
	}
}
