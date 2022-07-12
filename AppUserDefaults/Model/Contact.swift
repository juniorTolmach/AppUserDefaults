//
//  Contact.swift
//  AppUserDefaults
//
//  Created by Daniil Oreshenkov on 12.07.2022.
//

struct Contact {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

