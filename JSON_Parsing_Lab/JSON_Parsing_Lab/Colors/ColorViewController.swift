//
//  ColorViewController.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 11/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.dataSource = self
        print(colors.count)
    }
    func updateUI() {
        colors = Colors.getColors()
    }
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name.name.value
        cell.backgroundColor =  UIColor(red: CGFloat(color.rgb.r), green: CGFloat(color.rgb.g), blue: CGFloat(color.rgb.b), alpha: 0.95)
        return cell
    }
}
