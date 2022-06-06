//
//  SearchUsersViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/07.
//

import Foundation
import TwitCastingAPI

class SearchUsersViewModel: ObservableObject {
    
    @Published var usersResponse: TCUsersResponse?
    
    private let api = TwitCastingAPI()
    
    func searchUsers(token: String, words: String) async {
        
        do {
            
            let response = try await api.searchUsers(token: token, words: words)
            
            DispatchQueue.main.async {
                self.usersResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
}
