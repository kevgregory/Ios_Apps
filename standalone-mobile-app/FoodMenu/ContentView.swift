//
//  ContentView.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: MenuBar = .food
    @State private var searchText = ""
    @State private var isNightMode = false
    @StateObject var foodItemsData = FoodItemsData()
    
    var filteredMenuOptions: [MenuBar] {
        if searchText.isEmpty {
            return MenuBar.allCases
        } else {
            return MenuBar.allCases.filter { option in
                let items = option.foodItems(using: foodItemsData)
                return items.contains { foodItem in
                    foodItem.title.lowercased().contains(searchText.lowercased())
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack(spacing:16){
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {
                            isNightMode.toggle()
                        }){
                            Image(systemName: isNightMode ? "sun.max.fill" : "moon.fill")
                                .foregroundColor(isNightMode ? .yellow : .blue)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .foregroundColor(isNightMode ? .white : .black)
                    
                    HStack{
                        TextField("Search...", text: $searchText)
                            .padding(7)
                            .padding(.horizontal,25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                    
                                    if !searchText.isEmpty {
                                        Button(action: {
                                            self.searchText = ""
                                        }) {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                }
                            )
                            .padding (.horizontal, 10)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    // Options list
                    Options_List(selectedOption: $selectedOption, isNightMode: $isNightMode)
                        .padding([.top, .horizontal])
                        .overlay(
                            Divider()
                                .padding(.horizontal, -16)
                            , alignment: .bottom
                        )
                }
                
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(filteredMenuOptions, id: \.self) { option in
                                let filteredItems = option.foodItems(using: foodItemsData).filter {
                                        searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                                    }
                                Section(option: option, searchText: searchText, foodItems: filteredItems, onFavoriteToggle: { foodItem in
                                        foodItemsData.toggleFavorite(for: foodItem)
                                })
                            }
                            .onChange(of: selectedOption) {
                                withAnimation(.easeInOut) {
                                    proxy.scrollTo(selectedOption, anchor: .topTrailing)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(isNightMode ? Color.black : Color.white)
            .preferredColorScheme(isNightMode ? .dark : .light)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
