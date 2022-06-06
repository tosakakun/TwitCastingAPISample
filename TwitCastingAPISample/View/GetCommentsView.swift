//
//  CommentView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/01.
//

import SwiftUI
import TwitCastingAPI

struct GetCommentsView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = GetCommentsViewModel()
    
    @State private var movieId = ""
    
    var body: some View {
        
        VStack {
            TextField("ライブID", text: $movieId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.getComments(token: auth.token ,movieId: movieId)
                }
            } label: {
                Text("コメントを作成日時の降順で取得")
            }
            .padding()
            
            if let response = viewModel.getCommentsResponse {
                
                Text("総コメント数: \(response.allCount)")
                
                List {
                    ForEach(viewModel.comments) { comment in
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: comment.fromUser.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .cornerRadius(20)
                            } placeholder: {
                                Circle()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(Color.gray)
                            }
                            VStack(alignment: .leading) {
                                Text(comment.fromUser.name)
                                Text(comment.message)
                                Text("comment_id: \(comment.id)")
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            
            Spacer()

        }
        .navigationTitle("Get Comments テスト")

    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        GetCommentsView()
    }
}
