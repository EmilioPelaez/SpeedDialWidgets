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
		if intent is SimpleConfigurationIntent {
			return SimpleConfigurationIntentHandler()
		}
		
		return self
	}
	
}
