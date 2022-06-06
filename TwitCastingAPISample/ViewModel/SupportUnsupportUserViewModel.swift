//
//  SupportUnsupportUserViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import Foundation
import TwitCastingAPI

class SupportUnsupportUserViewModel: ObservableObject {
    
    @Published var supportUserResponse: TCSupportUserResponse?
    
    @Published var unsupportUserResponse: TCUnsupportUserResponse?
    
    private let api = TwitCastingAPI()
    
    func supportUser(token: String, targetUserIds: [String]) async {
        
        supportUserResponse = nil
        unsupportUserResponse = nil
        
        do {
            
            let response = try await api.supportUser(token: token, targetUserIds: targetUserIds)
            
            print(response)
            
            DispatchQueue.main.async {
                self.supportUserResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func unsupportUser(token: String, targetUserIds: [String]) async {
        
        supportUserResponse = nil
        unsupportUserResponse = nil
        
        do {
            
            let response = try await api.unsupportUser(token: token, targetUserIds: targetUserIds)
            
            print(response)
            
            DispatchQueue.main.async {
                self.unsupportUserResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
