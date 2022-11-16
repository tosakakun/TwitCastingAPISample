//
//  CurrentLiveHashtagViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/30.
//

import Foundation
import TwitCastingAPI

@MainActor
class CurrentLiveHashtagViewModel: ObservableObject {
    
    @Published var currentLiveHashtagResponse: TCCurrentLiveHashtagResponse?
    
    private let api = TwitCastingAPI()
    
    func setCurrentLiveHashtag(token: String, hashtag: String) async {
        
        do {
            
            let response = try await api.setCurrentLiveHashtag(token: token, hashtag: hashtag)
            
            self.currentLiveHashtagResponse = response
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func unsetCurrentLiveHashtag(token: String) async {
        
        do {
            
            let response = try await api.unsetCurrentLiveHashtag(token: token)
            
            self.currentLiveHashtagResponse = response
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    
    }

}
