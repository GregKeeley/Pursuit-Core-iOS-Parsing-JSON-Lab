//
//  RandomUserViewController.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 11/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.dataSource = self

    }
    func updateUI() {
        users = RandomUsers.getRandomUsers()
    }
}

extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = ("\(user.name.title) \(user.name.first) \(user.name.last)")
        cell.detailTextLabel?.text = user.name.first
        return cell
    }
}
