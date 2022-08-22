//
//  Widgets.swift
//  Widgets
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI
import WidgetKit

@main
struct Widgets: WidgetBundle {
	var body: some Widget {
		if #available(iOSApplicationExtension 16.0, *) {
			return WidgetBundleBuilder.buildBlock(PhoneWidget(), LockScreenWidget())
		} else {
			return PhoneWidget()
		}
	}
}
