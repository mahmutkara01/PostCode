//
//  PlaceCodeVM.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var locationData: LocationData?
    
    func fetchData(postCode: String) {
        
        let BASE_URL = "https://api.zippopotam.us/tr/"
        let API_PATH = postCode

        guard let url = URL(string: "\(BASE_URL)\(API_PATH)") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let locationData = try decoder.decode(LocationData.self, from: data)
                
                DispatchQueue.main.async {
                    self.locationData = locationData
                }
            } catch {
                print("Error while decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

