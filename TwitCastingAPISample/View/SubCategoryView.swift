//
//  SubCategoryView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct SubCategoryView: View {
    
    let category: TCCategory
    
    var body: some View {
        
        List {
            
            ForEach(category.subCategories) { subCategory in
                
                NavigationLink {
                    SubCategoryLiveMoviesListView(subCategory: subCategory)
                } label: {
                    Text("\(subCategory.name) (\(subCategory.count))")
                }

            }
            
        }
        .listStyle(.plain)
        .navigationTitle(category.name)
        
    }
}

struct SubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryView(category: TCCategory(id: "1", name: "カテゴリ", subCategories: [TCSubCategory(id: "1", name: "サブカテゴリ", count: 100)]))
    }
}
