//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import Foundation

struct MenuItem: Decodable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let descrip: String
    let category: String
}
