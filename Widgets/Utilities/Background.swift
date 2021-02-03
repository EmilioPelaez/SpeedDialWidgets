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
		[Background(topColor: Color("0_BackgroundTop"), bottomColor: Color("0_BackgroundBottom"))] +
		(0..<9)
		.map { ("\($0)_BackgroundTop", "\($0)_BackgroundBottom") }
		.map { (Color($0), Color($1)) }
		.map(Background.init)
	
	var gradient: Gradient {
		Gradient(colors: [topColor, bottomColor])
	}
	
}
