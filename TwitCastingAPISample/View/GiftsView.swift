//
//  GiftsView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/02.
//

import SwiftUI
import TwitCastingAPI

struct GiftsView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = GiftsViewModel()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await viewModel.getGifts(token: auth.token)
                }
            } label: {
                Text("直近10秒程度の間に送信されたアイテムを取得")
            }
            .padding()
            
            if let gifts = viewModel.giftsResponse?.gifts {
                
                List {
                    ForEach(gifts) { gift in
                        HStack {
                            AsyncImage(url: URL(string: gift.itemImage)) { image in
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80, alignment: .center)
                            } placeholder: {
                                Rectangle()
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .foregroundColor(Color.gray)
                            }
                            VStack(alignment: .leading) {
                                Text(gift.userName)
                                Text(gift.itemName)
                                Text(gift.message)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            
            Spacer()

        }
        .navigationBarTitle("Get Gifts テスト")
    }
}

struct GitsView_Previews: PreviewProvider {
    static var previews: some View {
        GiftsView()
    }
}
