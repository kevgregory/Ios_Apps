//
//  FoodItemDetailView.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/30/24.
//
import SwiftUI

struct FoodItemDetailView: View {
    var foodItem: FoodItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Food Image
                Image(foodItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .padding(.horizontal)

                // Title
                Text(foodItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Price
                Text("Price: \(foodItem.price)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)

                // Description
                Text(foodItem.description)
                    .font(.body)
                    .padding()

                Spacer()
            }
        }
        .navigationBarTitle(foodItem.title, displayMode: .inline)
        .accentColor(.orange)
    }
}


struct FoodItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFoodItem = FoodItem(title: "Nasi Goreng", description: "A popular Indonesian rice dish with pieces of meat and vegetables added. It can be considered an Indonesian twist to fried rice.", price: "$8.50", imageName: "Nasi-Goreng")

        FoodItemDetailView(foodItem: sampleFoodItem)
    }
}
