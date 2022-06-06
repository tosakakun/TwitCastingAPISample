//
//  CurrentLiveView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/26.
//

import SwiftUI
import TwitCastingAPI

struct CurrentLiveView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = CurrentLiveViewModel()
    
    @State private var userId = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.getCurrentLive(token: auth.token ,userId: userId)
                }
            } label: {
                Text("ユーザーが配信中の場合、ライブ情報を取得")
            }
            .padding()

            if let response = viewModel.currentLiveResponse {
                
                Text(response.movie.title)
                Text(response.movie.subtitle ?? "テロップなし")
                Text(response.broadcaster.name)
                
            }
            
            if let error = viewModel.error {
                if case .notFound(let code, let message) = error {
                    Text("\(code) \(message)")
                }
            }
            
            Spacer()
            
        }
        .navigationTitle("Get Current Live テスト")
    }
}

struct CurrentLiveView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLiveView()
    }
}
