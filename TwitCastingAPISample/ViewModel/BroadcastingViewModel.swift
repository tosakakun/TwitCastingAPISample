//
//  BroadcastingViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/08.
//

import Foundation
import TwitCastingAPI

class BroadcastingViewModel: ObservableObject {
    
    @Published var rtmpUrlResponse: TCRTMPUrlResponse?
    
    @Published var webMUrlResponse: TCWebMUrlResponse?
    
    private let api = TwitCastingAPI()
    
    func getRTMPUrl(token: String) async {
        
        do {
            
            let response = try await api.getRTMPUrl(token: token)
            
            DispatchQueue.main.async {
                self.rtmpUrlResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getWebMUrl(token: String) async {
        
        do {
            
            let response = try await api.getWebMUrl(token: token)
            
            DispatchQueue.main.async {
                self.webMUrlResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
