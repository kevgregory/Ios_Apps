//
//  Section.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/29/24.
//

import SwiftUI

struct Section: View {
    let option: MenuBar
    let searchText: String
    var foodItems: [FoodItem]
    var onFavoriteToggle: (FoodItem) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text (option.title)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(foodItems.filter { searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased()) })  { foodItem in
                NavigationLink(destination: FoodItemDetailView(foodItem: foodItem)) {
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8){
                            Text(foodItem.title)
                                .font(.title3.bold())
                            
                            Text("Price: \(foodItem.price)")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                        Spacer()
                        
                        Button(action: {
                            onFavoriteToggle(foodItem)
                        })
                        {
                            Image(systemName: foodItem.isFavorite ? "star.fill" : "star")
                                .foregroundColor(foodItem.isFavorite ? .yellow : .gray)
                        }
                        Image(foodItem.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 88)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                Divider()
            }
        }
    }
    struct Section_Previews: PreviewProvider {
        static var previews: some View {
            let sampleFoodItems = [
                FoodItem(title: "Mie Goreng", description: "Fried Rice", price: "$24", imageName: "Mie-Goreng"),
                FoodItem(title: "Mie Yamin", description: "Fried Rice", price: "$24", imageName: "Mie-Yamin")
            ]
            Section(option: .food, searchText: "", foodItems: sampleFoodItems, onFavoriteToggle: { _ in
            })
        }
    }
}
