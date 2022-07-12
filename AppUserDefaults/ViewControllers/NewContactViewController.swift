//
//  NewContactViewController.swift
//  AppUserDefaults
//
//  Created by Daniil Oreshenkov on 09.07.2022.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var doneButton: UIBarButtonItem!
    
    var delegate: NewContactViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndEdit()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc private func firstNameTextFieldDidChanged() {
        guard let firstName = firstNameTextField.text else { return }
        doneButton.isEnabled = !firstName.isEmpty
    }
        
    private func saveAndEdit() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let contact = Contact(name: firstName, surname: lastName)
        StorageManager.shared.save(contact: contact.fullName)
        
        delegate.saveContant(contact.fullName)
        dismiss(animated: true)
    }
}
