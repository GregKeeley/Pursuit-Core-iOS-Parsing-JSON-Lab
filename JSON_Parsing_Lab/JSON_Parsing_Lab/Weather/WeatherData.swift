//
//  WeatherData.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 11/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [City]
}

struct City: Codable {
    let name: String
    let main: TempInfo
    let weather: [WeatherInfo]
}

struct TempInfo: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}
struct WeatherInfo: Codable {
    let description: String
}

extension WeatherData {
    static func getCityData() -> [City] {
        var cities = [City]()
        guard let fileURL = Bundle.main.url(forResource: "weatherAPI", withExtension: "json") else {
            fatalError("could locate weatherAPI.json")
            
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let citiesData = try JSONDecoder().decode(WeatherData.self, from: data)
            cities = citiesData.list
        } catch {
            fatalError("Failed to load contents: \(error)")
        }
        return cities
    }
}
