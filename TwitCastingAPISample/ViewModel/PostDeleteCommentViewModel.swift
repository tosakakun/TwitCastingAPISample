//
//  PostDeleteCommentViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/01.
//

import Foundation
import TwitCastingAPI

class PostDeleteCommentViewModel: ObservableObject {
    
    @Published var postCommentResponse: TCPostCommentResponse?
    
    @Published var postedComments = [TCComment]()
    
    private let api = TwitCastingAPI()
    
    func postComment(token: String, movieId: String, comment: String) async {
        
        do {
            
            let response = try await api.postComment(token: token, movieId: movieId, comment: comment)
            
            DispatchQueue.main.async {
                self.postCommentResponse = response
                self.postedComments.append(response.comment)
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }

    }
    
    func deleteComment(token: String, movieId: String, indexSet: IndexSet) async {
        
        guard let index = indexSet.first else {
            print("index を取得できませんでした")
            return
        }
        
        let commentId = postedComments[index].id
        
        do {
            
            let response = try await api.deleteComment(token: token, movieId: movieId, commentId: commentId)
            
            print("削除されたコメントのID: \(response.commentId)")
            
            DispatchQueue.main.async {
                self.postedComments.remove(at: index)
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
