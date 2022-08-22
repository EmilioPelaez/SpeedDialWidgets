//
//  SimpleConfigurationIntentHandler.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 22/08/22.
//

import Intents
import Contacts

class SimpleConfigurationIntentHandler: BaseContactIntentHandler, SimpleConfigurationIntentHandling {
	
	func provideContactOptionsCollection(for intent: SimpleConfigurationIntent, with completion: @escaping (INObjectCollection<Contact>?, Error?) -> Void) {
		provideContactOptionsCollection(with: completion)
	}
	
	func provideAddressOptionsCollection(for intent: SimpleConfigurationIntent, with completion: @escaping (INObjectCollection<Address>?, Error?) -> Void) {
		provideAddressOptionsCollection(for: intent.contact?.identifier, with: completion)
	}
	
}
