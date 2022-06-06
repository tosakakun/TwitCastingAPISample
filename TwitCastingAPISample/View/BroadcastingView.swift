//
//  BroadcastingView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/08.
//

import SwiftUI
import TwitCastingAPI

struct BroadcastingView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = BroadcastingViewModel()
    
    var body: some View {

        VStack {
            
            VStack {
                if let response = viewModel.rtmpUrlResponse {
                    Text("RTMP配信 \(response.enabled ? "有効" : "無効")")
                    Text(response.url ?? "url なし")
                    Text(response.streamKey ?? "stream key なし")
                } else {
                    Text("Now Loading....")
                }
            }
            .padding()
            
            VStack {
                if let response = viewModel.webMUrlResponse {
                    Text("WebM配信 \(response.enabled ? "有効" : "無効")")
                    Text(response.url ?? "url なし")
                } else {
                    Text("Now Loading....")
                }
            }
            .padding()
            
            Spacer()
            
        }
        .task {
            await viewModel.getRTMPUrl(token: auth.token)
        }
        .task {
            await viewModel.getWebMUrl(token: auth.token)
        }
        .navigationTitle("Get RTMP, WebM Url テスト")
        
    }

}

struct BroadcastingView_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastingView()
    }
}
