//
//  SupportingStatusView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/02.
//

import SwiftUI
import TwitCastingAPI

struct SupportingStatusView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SupportingStatusViewModel()
    
    @State private var userId = ""
    @State private var targetUserId = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("対象ユーザーのID", text: $targetUserId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.getSupportingStatus(token: auth.token, userId: userId, targetUserId: targetUserId)
                }
            } label: {
                Text("サポータであるか調べる")
            }
            .padding()

            if let response = viewModel.supportingStatusResponse {
             
                Text(userId)
                Text("は")
                Text(response.targetUser.name)
                Text("を")
                Text("サポートして\(response.isSupporting ? "いる" : "いない")")
                Text("サポートした日時: \(viewModel.supported)")
            }
            
            Spacer()
            
        }
        .navigationTitle("Get Supporting Status テスト")
    }
}

struct SupportingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SupportingStatusView()
    }
}
