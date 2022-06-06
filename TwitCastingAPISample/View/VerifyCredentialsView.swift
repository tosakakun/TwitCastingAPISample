//
//  VerifyCredentialsView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/24.
//

import SwiftUI
import TwitCastingAPI

struct VerifyCredentialsView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = VerifyCredentialsViewModel()
    
    var body: some View {
        
        VStack {
            
            if let response = viewModel.response {
                
                Text("Appオブジェクト")
                Text(response.app.clientId)
                Text(response.app.name)
                Text(response.app.ownerUserId)
                Divider()
                Text("Userオブジェクト")
                AsyncImage(url: URL(string: response.user.image))
                Text(response.user.screenId)
                Text("\(response.user.level)")
                Text(response.user.profile)
                
            } else {
                Text("読込中...")
            }
            
            Spacer()
            
        }
        .task {
            await viewModel.verifyCredentials(token: auth.token)
        }
        .navigationTitle("VerifyCredentials テスト")
    }
}

struct VerifyCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCredentialsView()
    }
}
