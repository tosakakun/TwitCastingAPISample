//
//  CurrentLiveViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/26.
//

import Foundation
import TwitCastingAPI

class CurrentLiveViewModel: ObservableObject {
    
    @Published var currentLiveResponse: TCCurrentLiveResponse?
    
    @Published var error: TCError?
    
    private let api = TwitCastingAPI()
    
    func getCurrentLive(token: String, userId: String) async {
        
        currentLiveResponse = nil
        error = nil
        
        do {
            
            let currentLiveResponse = try await api.getCurrentLive(token: token, userId: userId)
            
            DispatchQueue.main.async {
                self.currentLiveResponse = currentLiveResponse
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
            DispatchQueue.main.async {
                self.error = error
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
