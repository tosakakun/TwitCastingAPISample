//
//  VerifyCredentialsViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/24.
//

import Foundation
import TwitCastingAPI

@MainActor
class VerifyCredentialsViewModel: ObservableObject {
    
    @Published var response: TCCredentialResponse?
    
    private let api = TwitCastingAPI()
    
    func verifyCredentials(token: String) async {
        
        do {
            
            let response = try await api.verifyCredentials(token: token)

            self.response = response
            
            print(response)
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
}
