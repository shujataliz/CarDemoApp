//
//  ListItem.swift
//  ApiManager
//
//  Created by Shujat Ali on 31/10/2023.
//

import Foundation


public struct ListItem: Decodable {
    //image is URL
    public let image: String
    public let title: String
    public let desc: String?
    public let stock: Int
    public let productionYear: String?
    
    private enum CodingKeys: String, CodingKey {
        case desc = "class"
        case image
        case title
        case stock
        case productionYear = "start_production"
    }
}
