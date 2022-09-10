//
//  ContentView.swift
//  PickerProject
//
//  Created by Vasichko Anna on 08.09.2022.
//

import SwiftUI

enum GoodsCategory: String, CaseIterable, Identifiable {
    case clothes
    case shoes
    case food
    case electronics
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .clothes:
            return "Clothes"
        case .shoes:
            return "Shoes"
        case .food:
            return "Food"
        case .electronics:
            return "Electronics"
        }
    }
}

struct ContentView: View {
    
    @State private var selectedItem: GoodsCategory = .clothes
    
    var body: some View {
        NavigationStack {
            List {
                Picker("Goods", selection: $selectedItem) {
                    ForEach(GoodsCategory.allCases) { category in
                        HStack {
                            Text(category.title).tag(category)
                            Spacer()
                            switch category {
                            case .clothes:
                                Image(systemName: "tshirt.fill")
                            case .shoes:
                                Image(systemName: "magnifyingglass.circle")
                            case .food:
                                Image(systemName: "fork.knife")
                            case .electronics:
                                Image(systemName: "headphones")
                            }
                        }
                    }
                    
                }
                HStack {
                    Text("You search in:")
                    Text(selectedItem.rawValue)
                }
            }
            .navigationTitle("Store")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
