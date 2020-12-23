//
//  ContactListTableViewController.swift
//  ContactList
//
//  Created by Владимир Беляев on 23.12.2020.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    // MARK: - Properties
    let persons = MockData.randomPersons

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = persons[indexPath.section].phoneNumber
            cell.imageView?.image = UIImage(systemName: "phone")
            
        } else {
            cell.textLabel?.text = persons[indexPath.section].email
            cell.imageView?.image = UIImage(systemName: "mail")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            deselectRow(in: tableView, at: indexPath)
            return
        }
        
        if indexPath.row == 0 {
            deselectRow(in: tableView, at: indexPath)
            
            guard let phoneNumber = cell.textLabel?.text, let url = URL(string: "tel://\(phoneNumber)") else {
                return
            }
            UIApplication.shared.open(url)
        } else {
            deselectRow(in: tableView, at: indexPath)
            
            guard let email = cell.textLabel?.text, let url = URL(string: "mailto:\(email)") else {
                return
            }
            UIApplication.shared.open(url)
        }
    }

}

// MARK: - Private
extension ContactListTableViewController {
    private func deselectRow(in tableView: UITableView, at indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
