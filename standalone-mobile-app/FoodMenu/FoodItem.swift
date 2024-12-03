//
//  FoodItem.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/29/24.
//

import Foundation

struct FoodItem: Identifiable, Decodable {
    var id: UUID = UUID()
    let title: String
    let description: String
    let price: String
    let imageName: String
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case title, description, price, imageName
    }
}
