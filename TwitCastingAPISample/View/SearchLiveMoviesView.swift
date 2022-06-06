//
//  SearchLiveMoviesView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/07.
//

import SwiftUI
import TwitCastingAPI

struct SearchLiveMoviesView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SearchLiveMoviesViewModel()
    
    @State private var context = ""
    
    @State private var selectedType = TwitCastingAPI.LiveMoviesType.recommend
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedType) {
                
                ForEach(TwitCastingAPI.LiveMoviesType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
                
            } label: {
                Text("検索種別")
            }
            .pickerStyle(.segmented)
            .padding()

            TextField("単語 or サブカテゴリID", text: $context)
                .textFieldStyle(.roundedBorder)
                .padding()
                .disabled(selectedType == .new || selectedType == .recommend)
            
            Button {
                Task {
                    await viewModel.searchLiveMovies(token: auth.token, type: selectedType, context: context)
                }
            } label: {
                Text("検索する")
            }
            .padding()
            
            if let response = viewModel.liveMoviesResponse {
                
                SearchLiveMoviesListView(response: response)

            }
            
            Spacer()

        }
        .navigationTitle("Search Live Movies テスト")
        
    }
}

struct SearchLiveMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLiveMoviesView()
    }
}

