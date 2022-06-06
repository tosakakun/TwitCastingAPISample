//
//  SupporterListViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/06.
//

import Foundation
import TwitCastingAPI

class SupporterListViewModel: ObservableObject {
    
    @Published var supporterListResponse: TCSupporterListResponse?
    
    private let api = TwitCastingAPI()
    
    func supporterList(token: String, userId: String) async {
        
        do {
            
            let response = try await api.supporterList(token: token, userId: userId, sort: .ranking)
            
            DispatchQueue.main.async {
                self.supporterListResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }

    }

}
