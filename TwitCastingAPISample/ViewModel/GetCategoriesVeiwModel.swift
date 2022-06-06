//
//  GetCategoriesVeiwModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/05/06.
//

import Foundation
import TwitCastingAPI

class GetCategoriesVeiwModel: ObservableObject {
    
    @Published var categoryResponse: TCCategoryResponse?
    
    private let api = TwitCastingAPI()
    
    func getCategories(token: String) async {
        
        do {
            
            let response = try await api.getCategories(token: token, lang: .ja)
            
            DispatchQueue.main.async {
                self.categoryResponse = response
            }
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
}
