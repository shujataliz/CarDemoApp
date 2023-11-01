//
//  ApiClientAdapter.swift
//  ApiManager
//
//  Created by Shujat Ali on 31/10/2023.
//

import Foundation


let BASE_URL = "https://raw.githubusercontent.com/shujataliz/testData/main/cars.json"
public struct ApiClientAdapter {
    
    private let api: ApiManager
    
    public init(api: ApiManager = URLSession.shared) {
        self.api = api
    }
    
    public var listItems: [ListItem] {
        get async throws {
            try await callGlobalApi(ofType: [ListItem].self)
        }
    }

    private func callGlobalApi<D: Decodable>(ofType type: D.Type) async throws -> D {
        guard let url = URL(string: BASE_URL) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await api.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }
}

