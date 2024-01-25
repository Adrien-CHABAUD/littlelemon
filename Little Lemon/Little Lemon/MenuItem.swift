//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem:Codable {
    let name: String
    let price: Float
    let description: String
    let image: String
}
