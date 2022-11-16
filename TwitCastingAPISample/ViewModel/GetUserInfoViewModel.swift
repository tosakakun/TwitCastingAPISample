//
//  GetUserInfoViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/19.
//

import Foundation
import TwitCastingAPI

@MainActor
class GetUserInfoViewModel: ObservableObject {
    
    @Published var userInfo: TCUserInfoResponse?
    
    private let api = TwitCastingAPI()
    
    func getUserInfo(token: String, id: String) async {
        
        do {
            
            let userInfo = try await api.getUserInfo(token: token, userId: id)
            
            self.userInfo = userInfo
            
            print(userInfo)
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
