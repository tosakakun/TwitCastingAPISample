//
//  SupportingStatusViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/02.
//

import Foundation
import TwitCastingAPI

@MainActor
class SupportingStatusViewModel: ObservableObject {
    
    @Published var supportingStatusResponse: TCSupportingStatusResponse?
    
    var supported: String {
        
        guard let response = supportingStatusResponse, let supported = response.supported else {
            return " - "
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(supported))
        let formattedDate = formatter.string(from: date)
        
        return formattedDate
        
    }
    
    private let api = TwitCastingAPI()
    
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    func getSupportingStatus(token: String, userId: String, targetUserId: String) async {
        
        do {
            
            let response = try await api.getSupportingStatus(token: token, userId: userId, targetUserId: targetUserId)
            
            self.supportingStatusResponse = response
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
