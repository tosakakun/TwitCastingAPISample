//
//  CurrentLiveSubtitleView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/30.
//

import SwiftUI
import TwitCastingAPI

struct CurrentLiveSubtitleView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject var viewModel = CurrentLiveSubtitleViewModel()
    
    @State var subtitle = ""
    
    var body: some View {
        VStack {
            TextField("テロップ", text: $subtitle)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {
                Task {
                    await viewModel.setCurrentLiveSubtitle(token: auth.token, subtitle: subtitle)
                }
            } label: {
                Text("テロップを設定")
            }
            .padding()

            Button {
                Task {
                    await viewModel.unsetCurrentLiveSubtitle(token: auth.token)
                }
            } label: {
                Text("テロップを解除")
            }
            .padding()
            
            if let response = viewModel.currentLiveSuttitleResponse {
                Text(response.movieId)
                Text(response.subtitle ?? "テロップは解除されました")
            }

            Spacer()
            
        }
        .navigationTitle("Set or Unset Current Live Subtitle テスト")
        
    }
}

struct CurrentLiveSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLiveSubtitleView()
    }
}
