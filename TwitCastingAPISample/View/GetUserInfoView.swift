//
//  GetUserInfoView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/19.
//

import SwiftUI
import TwitCastingAPI

struct GetUserInfoView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = GetUserInfoViewModel()
    
    @State private var id = ""

    var body: some View {
        
        VStack {
            TextField("id or screen_id を入力", text: $id)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {
                Task {
                    await viewModel.getUserInfo(token: auth.token, id: id)
                }
            } label: {
                Text("検索")
            }
            
            if let userInfo = viewModel.userInfo {
                
                AsyncImage(url: URL(string: userInfo.user.image))
                Text(userInfo.user.id)
                Text(userInfo.user.screenId)
                Text(userInfo.user.name)
                Text("\(userInfo.user.level)")
                Text(userInfo.user.profile)
                
                
            }

            Spacer()
            
        }
        .navigationTitle("Get User Info テスト")

    }
    
}

struct GetUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GetUserInfoView()
    }
}
