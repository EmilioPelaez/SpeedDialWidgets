//
//  ConfigurationIntentHandler.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 21/01/21.
//

import Intents
import Contacts

class ConfigurationIntentHandler: NSObject, ConfigurationIntentHandling {
	func provideContactOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Contact>?, Error?) -> Void) {
		do {
			let keys = [CNContactGivenNameKey, CNContactFamilyNameKey].map { $0 as CNKeyDescriptor }
			let containerId = CNContactStore().defaultContainerIdentifier()
			let predicate: NSPredicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
			let contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: keys)
			
			let results = contacts.map { Contact(identifier: $0.identifier, display: [$0.givenName, $0.familyName].joined(separator: " ")) }
			let collection = INObjectCollection(items: results)
			completion(collection, nil)
		} catch {
			print(error)
			let emptySection = INObjectSection(title: "Unable to load contacts. Please open the app.", items: [Contact]())
			let collection = INObjectCollection(sections: [emptySection])
			completion(collection, nil)
		}
	}
	
	func provideAddressOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Address>?, Error?) -> Void) {
		func handleFailure() {
			let emptySection = INObjectSection(title: "Unable to load phone and email address. Please open the app and try again.", items: [Address]())
			let collection = INObjectCollection(sections: [emptySection])
			completion(collection, nil)
		}
		
		guard let contactId = intent.contact?.identifier else {
			return handleFailure()
		}
		
		do {
			let keys = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey].map { $0 as CNKeyDescriptor }
			let predicate: NSPredicate = CNContact.predicateForContacts(withIdentifiers: [contactId])
			let contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: keys)
			
			func decodeLabel(_ label: String) -> String {
				CNLabeledValue<NSString>.localizedString(forLabel: label)
			}
			
			let phones = contacts
				.flatMap { $0.phoneNumbers }
				.map { ($0.value.stringValue.replacingOccurrences(of: " ", with: ""), [$0.label.map(decodeLabel(_:)), $0.value.stringValue].compactMap { $0 }.joined(separator: ": ")) }
				.map { Address(identifier: $0, display: $1) }
			
			let emails = contacts
				.flatMap { $0.emailAddresses }
				.map { ($0.value as String, [$0.label.map(decodeLabel(_:)), $0.value as String?].compactMap { $0 }.joined(separator: ": ")) }
				.map { Address(identifier: $0, display: $1) }
			
			let results = phones + emails
			guard !results.isEmpty else {
				return handleFailure()
			}
			let collection = INObjectCollection(items: results)
			completion(collection, nil)
		} catch {
			print(error)
			handleFailure()
		}
	}
	
	
}
