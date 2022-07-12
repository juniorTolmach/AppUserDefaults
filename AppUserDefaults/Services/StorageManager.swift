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
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return []}
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
