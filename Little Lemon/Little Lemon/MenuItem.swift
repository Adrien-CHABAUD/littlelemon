//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import Foundation

struct MenuItem: Codable {
    let id: Int64
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
    
    //enum codingKeys: String, CodingKey {
     //   case descriptionDish = "description"
        
    //}
}
