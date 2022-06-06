//
//  MoviesByUserView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/25.
//

import SwiftUI
import TwitCastingAPI

struct MoviesByUserView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = MoviesByUserViewModel()
    
    @State private var userId = ""
    
    var body: some View {
        
        VStack {
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.getMoviesByUser(token: auth.token, userId: userId)
                }
            } label: {
                Text("ユーザーが保有するライブを取得")
            }
            .padding()

            if let response = viewModel.moviesByUserResponse {
                
                Text("総履歴数: \(response.totalCount)")
                
                List {
                    
                    ForEach(response.movies) { movie in
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text("LIVE")
                                    .foregroundColor(movie.isLive ? Color.orange : Color.gray)
                                Text(": \(movie.title)")
                            }
                            Text("movie_id: \(movie.id)")
                        }
                    }
                    
                }
                .listStyle(.plain)

            }
            
            Spacer()
            
        }
        .navigationTitle("Get Movies by User テスト")
        
    }
    
}

struct MoviesByUserView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesByUserView()
    }
}
