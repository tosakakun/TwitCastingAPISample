//
//  SupportingListView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct SupportingListView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SupportingListViewModel()
    
    @State private var userId = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.supportingList(token: auth.token, userId: userId)
                }
            } label: {
                Text("ユーザーがサポートしているユーザー一覧を取得")
            }
            .padding()
            
            if let response = viewModel.supportingListResponse {
                
                Text("全レコード数: \(response.total)")
                
                List {
                    
                    ForEach(response.supporting) { user in
                        NavigationLink {
                            SupporterDetailView(user: user)
                        } label: {
                            Text(user.name)
                        }
                    }
                    
                }
                .listStyle(.plain)
                
            }
            
            Spacer()

        }
        .navigationTitle("Supporting List テスト")
        
    }
    
}

struct SupportingListView_Previews: PreviewProvider {
    static var previews: some View {
        SupportingListView()
    }
}
