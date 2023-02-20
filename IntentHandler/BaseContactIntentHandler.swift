//
//  BaseContactIntentHandler.swift
//  IntentHandler
//
//  Created by Emilio Peláez on 22/08/22.
//

import Intents
import Contacts

class BaseContactIntentHandler: NSObject {
	
	enum IntentError: Error {
		case noContacts
	}
	
	func provideContactOptionsCollection(with completion: @escaping (INObjectCollection<Contact>?, Error?) -> Void) {
		do {
			let keys = [CNContactGivenNameKey, CNContactMiddleNameKey, CNContactFamilyNameKey, CNContactNicknameKey, CNContactTypeKey, CNContactOrganizationNameKey]
				.map { $0 as CNKeyDescriptor }
			let store = CNContactStore()
			let containers = try store.containers(matching: nil)
			let contacts = try containers.flatMap {
				let containerId = $0.identifier
				let predicate: NSPredicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
				return try store.unifiedContacts(matching: predicate, keysToFetch: keys)
			}
			
			let results = contacts
				.filter { !$0.displayName.isEmpty }
				.sorted { $0.displayName.compare($1.displayName, options: [.diacriticInsensitive, .caseInsensitive]) == .orderedAscending }
				.map { Contact(identifier: $0.identifier, display: $0.displayName) }
			
			guard !results.isEmpty else { throw IntentError.noContacts }
			
			let dictionary = Dictionary(grouping: results) {
				String($0.displayString.folding(options: .diacriticInsensitive, locale: Locale(identifier: "en-US")).first ?? "#")
			}
			
			let sections = dictionary.keys
				.sorted()
				.map { ($0, dictionary[$0] ?? []) }
				.map(INObjectSection.init)
			
			let collection = INObjectCollection(sections: sections)
			completion(collection, nil)
		} catch {
			print(error)
			let emptySection = INObjectSection(title: "Unable to load contacts. Please open the app.", items: [Contact]())
			let collection = INObjectCollection(sections: [emptySection])
			completion(collection, nil)
		}
	}
	
	func provideAddressOptionsCollection(for contactId: String?, with completion: @escaping (INObjectCollection<Address>?, Error?) -> Void) {
		func handleFailure() {
			let emptySection = INObjectSection(title: "Unable to load phone and email address. Please open the app and try again.", items: [Address]())
			let collection = INObjectCollection(sections: [emptySection])
			completion(collection, nil)
		}
		
		guard let contactId = contactId else {
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
