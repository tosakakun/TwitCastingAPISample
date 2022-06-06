//
//  LiveThumbnailImageView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/25.
//

import SwiftUI
import TwitCastingAPI

struct LiveThumbnailImageView: View {
    
    @StateObject private var viewModel = LiveThumbnailViewModel()
    
    @State private var userId = ""
    
    @State private var imageSize = TwitCastingAPI.LiveThumbnailImageSize.small
    
    var body: some View {
        VStack {
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Picker(selection: $imageSize) {
                Text(TwitCastingAPI.LiveThumbnailImageSize.small.rawValue).tag(TwitCastingAPI.LiveThumbnailImageSize.small)
                Text(TwitCastingAPI.LiveThumbnailImageSize.large.rawValue).tag(TwitCastingAPI.LiveThumbnailImageSize.large)
            } label: {
                Text("Live Thumbnail Size")
            }
            .pickerStyle(.segmented)
            .padding()

            Button {
                Task {
                    await viewModel.getLiveThumbnailImage(userId: userId, size: imageSize)
                }
            } label: {
                Text("ライブサムネイルを取得")
            }
            .padding()
            
            if let uiImage = viewModel.uiImage {
                Image(uiImage: uiImage)
            }
            
            Spacer()

        }
        .navigationTitle("Live Thumbnail Image テスト")
    }
}

struct LiveThumbnailImageView_Previews: PreviewProvider {
    static var previews: some View {
        LiveThumbnailImageView()
    }
}
