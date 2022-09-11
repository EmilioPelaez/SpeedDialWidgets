//
//  ContentView.swift
//  WidgetPreview
//
//  Created by Emilio Peláez on 19/04/22.
//

import SwiftUI

struct ContentView: View {
	
	var lockScreenWidgets: Bool {
		return ProcessInfo.processInfo.arguments.contains("LockScreenWidgets")
	}
	
	var body: some View {
		if lockScreenWidgets {
			LockScreenView()
		} else {
			WidgetPreview()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
