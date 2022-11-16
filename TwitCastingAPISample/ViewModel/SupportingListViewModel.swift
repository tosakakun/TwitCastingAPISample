//
//  SupportingListViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import Foundation
import TwitCastingAPI

@MainActor
class SupportingListViewModel: ObservableObject {
    
    @Published var supportingListResponse: TCSupportingListResponse?
    
    private let api = TwitCastingAPI()
    
    func supportingList(token: String, userId: String) async {
        
        do {
            
            let response = try await api.supportingList(token: token, userId: userId)
            
            self.supportingListResponse = response
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }

    }
}
