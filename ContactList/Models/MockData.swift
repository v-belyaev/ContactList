//
//  DataManager.swift
//  ContactList
//
//  Created by Владимир Беляев on 23.12.2020.
//

import Foundation

struct MockData {
    static let firstNames: [String] = [
        "Oliver", "Harry", "George",
        "Jack", "Jacob", "Leo",
        "Evelyn", "Amelia", "Mia"]

    static let lastNames: [String] = [
        "Smith", "Jones", "Williams",
        "Brown", "Taylor", "Davies",
        "Wilson", "Evans", "Thomas"]

    static let emails: [String] = [
        "aaa@gmail.com", "bbb@gmail.com", "ccc@gmail.com",
        "ddd@gmail.com", "eee@gmail.com", "fff@gmail.com",
        "ggg@gmail.com", "hhh@gmail.com", "iii@gmail.com"]

    static let phoneNumbers: [String] = [
        "89999010101", "89999020202", "89999030303",
        "89999040404", "89999050505", "89999060606",
        "89999070707", "89999080808", "89999090909"]
    
    static var randomPersons: [Person] = {
        return getRandomPersons()
    }()
    
    static private func getRandomPersons() -> [Person] {
        var persons: [Person] = []
        
        let randomFirstNames = firstNames.shuffled()
        let randomLastNames = lastNames.shuffled()
        let randomEmails = emails.shuffled()
        let randomPhones = phoneNumbers.shuffled()
        
        for person in zip(
            zip(randomFirstNames, randomLastNames),
            zip(randomEmails, randomPhones)
        ) {
            persons.append(Person(
                firstName: person.0.0,
                lastName: person.0.1,
                email: person.1.0,
                phoneNumber: person.1.1))
        }
        
        return persons
    }
}
