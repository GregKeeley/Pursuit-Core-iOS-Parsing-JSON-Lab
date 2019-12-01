//
//  WeatherDetailViewController.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 11/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    
    var weatherInfo: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        guard let weatherInfo = weatherInfo else {
            fatalError("verify prepare for segue")
        }
        navigationItem.title = weatherInfo.name
        tempLabel.text = ("Temperature: \(weatherInfo.main.temp.description)")
        humidityLabel.text = ("Humidity: \(weatherInfo.main.humidity.description)")
        tempMinLabel.text = ("Min Temp: \(weatherInfo.main.temp_min.description)")
        tempMaxLabel.text = ("Max Temp: \(weatherInfo.main.temp_max.description)")
        descriptionLabel.text = weatherInfo.weather[0].description.description
    }
}
