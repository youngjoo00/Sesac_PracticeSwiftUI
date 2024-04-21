//
//  Category.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/22/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    @State private var query = ""
    
    var filterCategory: [Category] {
        return query.isEmpty ? categorys : categorys.filter { $0.name == query }
    }
    
    var categoryData: [String] = ["SF", "가족", "스릴러", "액션", "로맨스"]
    
    @State private var categorys: [Category] = [
        Category(name: "SF", count: 0),
        Category(name: "가족", count: 1),
        Category(name: "스릴러", count: 2),
        Category(name: "액션", count: 3),
        Category(name: "로맨스", count: 4),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { data in
                    NavigationLink {
                        
                    } label: {
                        Text(data.name + "- \(data.count)")
                    }
                }
            }
            .navigationTitle("영화 검색")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $query, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        let categoryItem = Category(name: categoryData.randomElement()!, count: .random(in: 1...100))
                        categorys.append(categoryItem)
                    } label: {
                        Text("추가")
                    }
                }
            }
        }
       
    }
}

#Preview {
    CategoryView()
}
