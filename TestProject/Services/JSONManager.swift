//
//  JSONManager.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import Foundation

class JSONManager {
    
    static var shared = JSONManager(); private init() {}
    
    func getInfo(word: String) async throws -> [Vendor] {
            let jsonURLString = "https://raw.githubusercontent.com/urlaunched-com/iOSMiddleTestTask/main/vendors.json"
            guard let jsonURL = URL(string: jsonURLString) else {
                throw DecodingError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: jsonURL)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Wrong response")
                throw DecodingError.invalidResponse
            }
        
            do {
                let decoder = JSONDecoder()
                let cafes = try decoder.decode(Cafes.self, from: data)
                guard word.count > 2 else { return cafes.vendors }
                return cafes.vendors.filter { $0.companyName.uppercased().contains(word.uppercased()) }
            } catch {
                print("Wrong Data")
                throw DecodingError.decodingFailed
            }
        }
}

enum DecodingError: Error {
    case invalidURL,
         invalidResponse,
         decodingFailed
}
