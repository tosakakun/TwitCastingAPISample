//
//  CurrentLiveHashtagView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/30.
//

import SwiftUI
import TwitCastingAPI

struct CurrentLiveHashtagView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = CurrentLiveHashtagViewModel()
    
    @State private var hashtag = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ハッシュタグ", text: $hashtag)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.setCurrentLiveHashtag(token: auth.token, hashtag: hashtag)
                }
            } label: {
                Text("ライブのハッシュタグを設定")
            }
            .padding()
            
            Button {
                Task {
                    await viewModel.unsetCurrentLiveHashtag(token: auth.token)
                }
            } label: {
                Text("ライブのハッシュタグを解除")
            }
            
            if let response = viewModel.currentLiveHashtagResponse {
                Text(response.movieId)
                Text(response.hashtag ?? "ハッシュタグが解除されました")
            }
            
            Spacer()

        }
        .navigationTitle("Set or Unset Current Live Hashtag テスト")
        
    }
}

struct CurrentLiveHashtagView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLiveHashtagView()
    }
}
