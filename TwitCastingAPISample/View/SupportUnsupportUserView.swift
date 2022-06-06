//
//  SupportUnsupportUserView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct SupportUnsupportUserView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SupportUnsupportUserViewModel()
    
    @State private var targetUserId = ""
    
    var body: some View {
        
        VStack {
            TextField("ユーザーID", text: $targetUserId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.supportUser(token: auth.token, targetUserIds: [targetUserId])
                }
            } label: {
                Text("サポートする")
            }
            .padding()
            
            Button {
                Task {
                    await viewModel.unsupportUser(token: auth.token, targetUserIds: [targetUserId])
                }
            } label: {
                Text("サポートを解除する")
            }
            .padding()

            if let response = viewModel.supportUserResponse {
                Text("\(response.addedCount) 件サポートしました")
            }
            
            if let response = viewModel.unsupportUserResponse {
                Text("\(response.removedCount) 件サポートを解除しました")
            }
            
            Spacer()
            
        }
        .navigationTitle("Support and Unsupport User テスト")
        
    }
    
}

struct SupportUnsupportUserView_Previews: PreviewProvider {
    static var previews: some View {
        SupportUnsupportUserView()
    }
}
