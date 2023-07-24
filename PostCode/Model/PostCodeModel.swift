//
//  Model.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import Foundation

struct LocationData: Codable, Identifiable {
    
    var id = UUID()
    
    let postCode: String
    let country: String
    let countryAbbreviation: String
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
        case postCode = "post code"
        case country
        case countryAbbreviation = "country abbreviation"
        case places
    }
}

struct Place: Codable, Hashable {
    let placeName: String
    let longitude: String
    let state: String
    let stateAbbreviation: String
    let latitude: String
    
    enum CodingKeys: String, CodingKey {
        case placeName = "place name"
        case longitude
        case state
        case stateAbbreviation = "state abbreviation"
        case latitude
    }
}

    

