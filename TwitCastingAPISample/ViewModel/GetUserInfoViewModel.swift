//
//  GetUserInfoViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/19.
//

import Foundation
import TwitCastingAPI

class GetUserInfoViewModel: ObservableObject {
    
    @Published var userInfo: TCUserInfoResponse?
    
    private let api = TwitCastingAPI()
    
    func getUserInfo(token: String, id: String) async {
        
        do {
            
            let userInfo = try await api.getUserInfo(token: token, userId: id)
            
            DispatchQueue.main.async {
                self.userInfo = userInfo
            }
            
            print(self.userInfo as Any)
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
