//
//  ColorsData.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 12/1/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct Colors: Codable {
    let colors = [Color]()
}

struct Color: Codable {
    let mode: String
}

extension Colors {
    static func getColors() -> [Color] {
        var colors = [Color]()
        guard let fileURL = Bundle.main.url(forResource: "ColorsData", withExtension: "json") else {
            fatalError("Could not locate ColorsData.json")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let colorData =  try JSONDecoder().decode(Colors.self, from: data)
            colors = colorData.colors
        } catch {
            fatalError("failed to load ColorsData")
        }
        return colors
    }
}
