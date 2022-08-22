//
//  ConfigurationIntentHandler.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import Intents
import Contacts

class ConfigurationIntentHandler: BaseContactIntentHandler, ConfigurationIntentHandling {
	
	func provideContactOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Contact>?, Error?) -> Void) {
		provideContactOptionsCollection(with: completion)
	}
	
	func provideAddressOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Address>?, Error?) -> Void) {
		provideAddressOptionsCollection(for: intent.contact?.identifier, with: completion)
	}
	
}
