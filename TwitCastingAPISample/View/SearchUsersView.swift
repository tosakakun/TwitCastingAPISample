//
//  SearchUsersView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/07.
//

import SwiftUI
import TwitCastingAPI

struct SearchUsersView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = SearchUsersViewModel()
    
    @State private var words = ""
    
    var body: some View {
        
        VStack {
            
            TextField("検索ワード", text: $words)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.searchUsers(token: auth.token, words: words)
                }
            } label: {
                Text("ユーザーを検索")
            }
            .padding()
            
            if let response = viewModel.usersResponse {
                
                List {
                    
                    ForEach(response.users) { user in
                        HStack {
                            AsyncImage(url: URL(string: user.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .cornerRadius(20)
                            } placeholder: {
                                Circle()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(Color.gray)
                            }

                            Text(user.name)
                        }
                    }
                    
                }
                .listStyle(.plain)

            }
            
            Spacer()

        }
        .navigationBarTitle("Search Users テスト")
        
    }

}

struct SearchUsersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUsersView()
    }
}
