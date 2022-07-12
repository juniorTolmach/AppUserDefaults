//
//  StorageManager.swift
//  AppUserDefaults
//
//  Created by Daniil Oreshenkov on 12.07.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "Contacts"
    
    private init() {}
    
    func save(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: key)
    }
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: key) as? [String] {
            return contacts
        }
        return []
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
}
