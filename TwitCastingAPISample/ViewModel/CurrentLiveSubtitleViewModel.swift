//
//  CurrentLiveSubtitleViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/30.
//

import Foundation
import TwitCastingAPI

class CurrentLiveSubtitleViewModel: ObservableObject {
    
    @Published var currentLiveSuttitleResponse: TCCurrentLiveSubtitleResponse?
    
    private let api = TwitCastingAPI()
    
    func setCurrentLiveSubtitle(token: String, subtitle: String) async {
        
        do {
            
            let response = try await api.setCurrentLiveSubtitle(token: token, subtitle: subtitle)
            
            DispatchQueue.main.async {
                self.currentLiveSuttitleResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func unsetCurrentLiveSubtitle(token: String) async {
        
        do {
            
            let response = try await api.unsetCurrentLiveSubtitle(token: token)
            
            DispatchQueue.main.async {
                self.currentLiveSuttitleResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
