//
//  LiveThumbnailImageViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/25.
//

import Foundation
import SwiftUI
import TwitCastingAPI

class LiveThumbnailViewModel: ObservableObject {
    
    @Published var uiImage: UIImage?
    
    private let api = TwitCastingAPI()

    func getLiveThumbnailImage(userId: String, size: TwitCastingAPI.LiveThumbnailImageSize) async {
        
        do {
            
            let data = try await api.getLiveThumbnailImage(userId: userId, size: size)
            
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.uiImage = uiImage
                }
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
