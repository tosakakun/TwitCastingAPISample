//
//  SupporterListView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct SupporterListView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SupporterListViewModel()
    
    @State private var userId = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ユーザーID", text: $userId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.supporterList(token: auth.token, userId: userId)
                }
            } label: {
                Text("指定したユーザーをサポートしているユーザー一覧を取得")
            }
            
            if let response = viewModel.supporterListResponse {
                
                List {
                    
                    ForEach(response.supporters) { user in
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
        .navigationTitle("Supporter List テスト")
        
    }
    
}

struct SupporterListView_Previews: PreviewProvider {
    static var previews: some View {
        SupporterListView()
    }
}
