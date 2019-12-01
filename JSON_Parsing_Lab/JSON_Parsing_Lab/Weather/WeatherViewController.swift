//
//  WeatherViewController.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 11/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var weatherData = [City]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    func loadData() {
        weatherData =  WeatherData.getCityData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDVC = segue.destination as? WeatherDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("Could not retrieve an instance of WeatherDetailsViewController")
        }
        let weatherInfo = weatherData[indexPath.row]
        weatherDVC.weatherInfo = weatherInfo
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let city = weatherData[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = city.main.temp.description
        return cell
    }
}
