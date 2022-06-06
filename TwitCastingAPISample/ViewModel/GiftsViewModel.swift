//
//  GiftsViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/02.
//

import Foundation
import TwitCastingAPI

class GiftsViewModel: ObservableObject {
    
    @Published var giftsResponse: TCGiftsResponse?
    
    private let api = TwitCastingAPI()
    
    private var sliceId = -1
    
    func getGifts(token: String) async {
        
        do {
            
            let response = try await api.getGifts(token: token, sliceId: sliceId)
            
            self.sliceId = response.sliceId
            
            DispatchQueue.main.async {
                self.giftsResponse = response
            }
            
            print(response)

        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
