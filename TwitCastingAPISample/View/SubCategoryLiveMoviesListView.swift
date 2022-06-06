//
//  SubCategoryLiveMoviesListView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/07.
//

import SwiftUI
import TwitCastingAPI

struct SubCategoryLiveMoviesListView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SearchLiveMoviesViewModel()
    
    let subCategory: TCSubCategory
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let response = viewModel.liveMoviesResponse {
                
                SearchLiveMoviesListView(response: response)
                
            } else {
                Text("Now Loading...")
            }
            
        }
        .onAppear {
            Task {
                await viewModel.searchLiveMovies(token: auth.token, type: .category, context: subCategory.id)
            }
        }
        .navigationTitle(subCategory.name)
        
        
    }
}

struct SubCategoryLiveMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryLiveMoviesListView(subCategory: TCSubCategory(id: "1", name: "sub", count: 1))
    }
}
