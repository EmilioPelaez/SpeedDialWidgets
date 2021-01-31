//
//  EmptyAvatar.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 31/01/21.
//

import SwiftUI

struct EmptyAvatar: View {
	let size: CGFloat
	
	var body: some View {
		ZStack {
			Rectangle().fill(Color.white.opacity(0.25))
			Image(systemName: "person.fill").font(.system(size: size))
		}
	}
}
