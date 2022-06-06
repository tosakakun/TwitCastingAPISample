//
//  MovieInfoView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/25.
//

import SwiftUI
import TwitCastingAPI

struct MovieInfoView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @State private var movieId = ""
    
    @StateObject private var viewModel = MovieInfoViewModel()
    
    var body: some View {

        VStack {
            TextField("ライプID", text: $movieId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.getMovieInfo(token: auth.token, movieId: movieId)
                }
            } label: {
                Text("ライブ情報を取得")
            }
            .padding()
            
            if let response = viewModel.movieInfoResponse {
                
                Text("ライブID: \(response.movie.id)")
                Text("タイトル: \(response.movie.title)")
                Text("LIVE")
                    .foregroundColor(response.movie.isLive ? Color.orange : Color.gray)
                Text("配信者: \(response.broadcaster.name)")

            }
            
            Spacer()

        }
        .navigationTitle("Get Movie Info テスト")

    }

}

struct MovieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView()
    }
}
