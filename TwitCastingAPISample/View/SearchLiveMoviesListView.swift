//
//  SearchLiveMoviesListView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/07.
//

import SwiftUI
import TwitCastingAPI

struct SearchLiveMoviesListView: View {
    
    let response: TCLiveMoviesResponse
    
    var body: some View {
        
        List {
            
            ForEach(response.movies) { elem in
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: elem.movie.smallThumbnail)) { image in
                        image
                            .resizable()
                            .frame(width: 160, height: 90, alignment: .center)
                    } placeholder: {
                        Rectangle()
                            .frame(width: 160, height: 90, alignment: .center)
                            .foregroundColor(Color.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(elem.movie.title)
                        Text(elem.broadcaster.name)
                    }
                }
            }
            
        }
        .listStyle(.plain)
        
    }
}

