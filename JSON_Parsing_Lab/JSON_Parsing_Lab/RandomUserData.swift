//
//  RandomUserData.swift
//  JSON_Parsing_Lab
//
//  Created by Gregory Keeley on 12/4/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct RandomUsers: Codable {
    let results: [User]
}

struct User: Codable {
    let name: nameDetails
    let location: Location
    let email: String
    
}
struct nameDetails: Codable {
    let title: String
    let first: String
    let last: String
}
struct Location: Codable {
    let street: StreetAddress
    let city: String
    let state: String
    let country: String
//    let postcode: Int - TODO: Account for Strings and Ints
}
struct StreetAddress: Codable {
    let number: Int
    let name: String
}
struct EmailAddress: Codable {
    let email: String
}

extension RandomUsers {
    static func getRandomUsers() -> [User] {
        var users = [User]()
        guard let fileURL = Bundle.main.url(forResource: "RandomUsersData", withExtension: "json") else {
            fatalError("could not locate json data")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(RandomUsers.self, from: data)
            users = userData.results
        } catch {
            fatalError("Could not load contents: \(error)")
        }
        return users
    }
}
