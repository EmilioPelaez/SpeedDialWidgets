//
//  SmallImageWidgetView.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

extension SmallImageWidget {
	struct WidgetView : View {
		var entry: Entry
		
		var body: some View {
		}
	}
}



struct Widgets_Previews: PreviewProvider {
	static var previews: some View {
		SmallImageWidget.WidgetView(entry: .example)
			.previewContext(WidgetPreviewContext(family: .systemSmall))
	}
}
