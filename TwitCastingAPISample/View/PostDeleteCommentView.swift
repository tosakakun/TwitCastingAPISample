//
//  PostDeleteCommentView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/01.
//

import SwiftUI
import TwitCastingAPI

struct PostDeleteCommentView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = PostDeleteCommentViewModel()
    
    @State private var movieId = ""
    
    @State private var comment = ""
    
    var body: some View {
        
        VStack {
            
            TextField("ライブID", text: $movieId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("コメント", text: $comment)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    await viewModel.postComment(token: auth.token ,movieId: movieId, comment: comment)
                }
            } label: {
                Text("コメント投稿")
            }
            .padding()

            if let comments = viewModel.postedComments {
                List {
                    ForEach(comments) { comment in
                        VStack(alignment: .leading) {
                            Text(comment.message)
                            Text("コメントID: \(comment.id)")
                        }
                    }
                    .onDelete { indexSet in
                        Task {
                            await viewModel.deleteComment(token: auth.token ,movieId: movieId, indexSet: indexSet)
                        }
                    }

                }
                .listStyle(.plain)
                
            }

            Spacer()
            
        }
        .navigationTitle("Post Delete Commnet コメント")
        
        
    }
}

struct PostDeleteCommentView_Previews: PreviewProvider {
    static var previews: some View {
        PostDeleteCommentView()
    }
}
