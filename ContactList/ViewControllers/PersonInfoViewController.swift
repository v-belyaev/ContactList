//
//  PersonInfoViewController.swift
//  ContactList
//
//  Created by Владимир Беляев on 23.12.2020.
//

import UIKit

class PersonInfoViewController: UIViewController {

    // MARK: - Properties
    var person: Person!
    
    // MARK: - IB Outlets
    @IBOutlet var personPhoneLabel: UILabel! {
        didSet {
            personPhoneLabel.text = person.phoneNumber
        }
    }
    
    @IBOutlet var emailPersonLabel: UILabel! {
        didSet {
            emailPersonLabel.text = person.email
        }
    }
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.topViewController?.navigationItem.title = person.fullName
    }

}
