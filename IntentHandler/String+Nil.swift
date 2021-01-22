//
//  String+Nil.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 22/01/21.
//

import Foundation

extension String {
	var nilOnEmpty: String? {
		trimmingCharacters(in: .whitespaces).isEmpty ? nil : self
	}
}
