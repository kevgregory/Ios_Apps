//
//  Options List.swift
//  FoodMenu
//
//  Created by Kevin Thomas on 1/29/24.
//

import SwiftUI

struct Options_List: View {
    @Binding var selectedOption: MenuBar
    @Binding var isNightMode: Bool
    @Namespace var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(MenuBar.allCases, id: \.self) { item in
                        VStack {
                        Text(item.title)
                                .foregroundColor(item == selectedOption ? (isNightMode ? .white : .black) : .gray)
                        
                        if selectedOption == item {
                            Capsule()
                                .fill(isNightMode ? .white : .black)
                                .matchedGeometryEffect(id: "item", in: animation)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                        } else {
                            Capsule()
                                .fill(.clear)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                self.selectedOption = item
                                proxy.scrollTo(item, anchor: .topTrailing)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Option_List_Previews: PreviewProvider {
    static var previews: some View {
        Options_List(selectedOption: .constant(.food), isNightMode: .constant(false))
    }
}

