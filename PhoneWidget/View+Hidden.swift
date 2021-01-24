//
//  View+Hidden.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 24/01/21.
//

import SwiftUI

extension View {
	@ViewBuilder func hidden(_ hide: Bool, remove: Bool = true) -> some View {
		if hide {
			if !remove {
				self.hidden()
			}
		} else {
			self
		}
	}
}
