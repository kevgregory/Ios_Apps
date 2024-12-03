//
//  FoodItemsData.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/30/24.
//

import Foundation

class FoodItemsData: ObservableObject {
    @Published var foodFood: [FoodItem] = []
    @Published var mieFood: [FoodItem] = []
    @Published var nasiayamFood: [FoodItem] = []
    @Published var dessertFood: [FoodItem] = []
    @Published var otherFood: [FoodItem] = []
    
    init() {
        loadCategoryData(category: &foodFood, filename: "foodFood")
        loadCategoryData(category: &mieFood, filename: "mieFood")
        loadCategoryData(category: &nasiayamFood, filename: "nasiayamFood")
        loadCategoryData(category: &dessertFood, filename: "dessertFood")
        loadCategoryData(category: &otherFood, filename: "otherFood")
    }
    
    func loadCategoryData(category: inout [FoodItem], filename: String) {
            if let url = Bundle.main.url(forResource: filename, withExtension: "json"),
               let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let jsonData = try? decoder.decode([FoodItem].self, from: data) {
                    category = jsonData
                }
            }
        }
    func toggleFavorite(for item: FoodItem) {
            if let index = foodFood.firstIndex(where: { $0.id == item.id }) {
                foodFood[index].isFavorite.toggle()
            }
            if let index = mieFood.firstIndex(where: { $0.id == item.id }) {
                mieFood[index].isFavorite.toggle()
            }
            if let index = nasiayamFood.firstIndex(where: { $0.id == item.id }) {
                nasiayamFood[index].isFavorite.toggle()
            }
            if let index = dessertFood.firstIndex(where: { $0.id == item.id }) {
                dessertFood[index].isFavorite.toggle()
            }
            if let index = otherFood.firstIndex(where: { $0.id == item.id }) {
                otherFood[index].isFavorite.toggle()
            }
        }
    }
