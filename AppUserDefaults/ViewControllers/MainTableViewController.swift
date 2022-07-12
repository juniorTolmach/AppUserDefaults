//
//  TableViewController.swift
//  AppUserDefaults
//
//  Created by Daniil Oreshenkov on 09.07.2022.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContant(_ contact: String)
}

class MainTableViewController: UITableViewController {
    
    
    @IBOutlet var viewTable: UITableView!
    
    private var contacts: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let newContactVC = segue.destination as? NewContactViewController else { return }
                
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
