//
//  Background.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

struct Background {
	let topColor: Color
	let bottomColor: Color
	
	static var all: [Background] =
		[Background(topColor: Color("ColorTop0"), bottomColor: Color("ColorBottom1"))] +
		(0..<8)
		.map { ("ColorTop\($0)", "ColorBottom\($0)") }
		.map { (Color($0), Color($1)) }
		.map(Background.init)
	
	var gradient: Gradient {
		Gradient(colors: [topColor, bottomColor])
	}
	
}
