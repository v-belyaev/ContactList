//
//  Person.swift
//  ContactList
//
//  Created by Владимир Беляев on 23.12.2020.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
