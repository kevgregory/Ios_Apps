//
//  Menu Bar.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/29/24.
//

import Foundation

enum MenuBar: Int, CaseIterable {
    case favorites
    case food
    case mie
    case nasiayam
    case dessert
    case other
    
    var title: String {
        switch self {
        case .favorites: return "Favorites"
        case .food: return "Food"
        case .mie: return "Mie"
        case .nasiayam: return "Nasi Ayam"
        case .dessert: return "Dessert"
        case .other: return "Other"
        }
    }
    
    func foodItems(using data: FoodItemsData) -> [FoodItem] {
        switch self {
        case .favorites:
            let favoriteItems = data.foodFood.filter { $0.isFavorite } +
                                data.mieFood.filter { $0.isFavorite } +
                                data.nasiayamFood.filter { $0.isFavorite } +
                                data.dessertFood.filter { $0.isFavorite } +
                                data.otherFood.filter { $0.isFavorite }
                        return favoriteItems.isEmpty ? [FoodItem]() : favoriteItems
        case .food:
            return data.foodFood
        case .mie:
            return data.mieFood
        case .nasiayam:
            return data.nasiayamFood
        case .dessert:
            return data.dessertFood
        case .other:
            return data.otherFood
        }
    }
}

