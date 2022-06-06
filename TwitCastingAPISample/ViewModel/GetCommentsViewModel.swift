//
//  CommentViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/01.
//

import Foundation
import TwitCastingAPI

class GetCommentsViewModel: ObservableObject {
    
    @Published var getCommentsResponse: TCGetCommentsResponse?
    
    /// コメントの配列
    @Published var comments = [TCComment]()
    
    /// 最新のコメントのID
    private var lastCommentId: String?
    
    private let api = TwitCastingAPI()
    
    func getComments(token: String, movieId: String) async {
        
        do {
            
            let response = try await api.getComments(token: token, movieId: movieId, sliceId: lastCommentId)
            
            DispatchQueue.main.async {
                self.getCommentsResponse = response
                self.comments.insert(contentsOf: response.comments, at: 0)
            }
            
            // 最新のコメントのIDを保存
            if let lastCommentId = response.comments.first?.id {
                self.lastCommentId = lastCommentId
            }

        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
