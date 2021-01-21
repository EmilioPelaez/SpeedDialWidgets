//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import Intents

class IntentHandler: INExtension {
	
	override func handler(for intent: INIntent) -> Any {
		if intent is ConfigurationIntent {
			return ConfigurationIntentHandler()
		}
		
		return self
	}
	
}
