//
//  CNContact+Name.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 22/01/21.
//

import Contacts

extension CNContact {
	
	var displayName: String {
//		if !nickname.isEmpty {
//			return nickname.trimmingCharacters(in: .whitespaces)
//		}
		
		let fullName = [givenName.nilOnEmpty, middleName.nilOnEmpty, familyName.nilOnEmpty]
			.compactMap { $0 }
			.joined(separator: " ")
		if let finalName = fullName.nilOnEmpty {
			return finalName
		}
		
		if contactType == .organization, let organizationName = organizationName.nilOnEmpty {
			return organizationName
		}
		
		return ""
	}
	
}
