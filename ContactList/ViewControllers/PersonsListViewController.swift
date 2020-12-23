//
//  ViewController.swift
//  ContactList
//
//  Created by Владимир Беляев on 23.12.2020.
//

import UIKit

class PersonsListViewController: UIViewController {

    // MARK: - Properties
    let persons = MockData.randomPersons
    
    // MARK: - IB Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - ViewController Lifecycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personInfoViewController = segue.destination as? PersonInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let currentPerson = persons[indexPath.row]
        personInfoViewController.person = currentPerson
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PersonsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = persons[indexPath.row].fullName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
