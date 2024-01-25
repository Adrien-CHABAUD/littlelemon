//
//  MenuList.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-25.
//

import Foundation

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
