//
//  MainViewController.swift
//  AppUserDefaults
//
//  Created by Daniil Oreshenkov on 09.07.2022.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContant(_ contact: String)
}

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var contacts: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = StorageManager.shared.fetchContacts()
    }
    
    // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let newContactVC = segue.destination as? NewContactViewController else { return }
         newContactVC.delegate = self
     }
}

    // MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact
        cell.contentConfiguration = content
        return cell
    }
}

    // MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            StorageManager.shared.deleteContact(at: indexPath.row)
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

    // MARK: - NewContactViewControllerDelegate

extension MainViewController: NewContactViewControllerDelegate {
    func saveContant(_ contact: String) {
        contacts.append(contact)
        tableView.reloadData()
    }
}



