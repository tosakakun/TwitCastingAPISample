//
//  MoviesByUserViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/25.
//

import Foundation
import TwitCastingAPI

class MoviesByUserViewModel: ObservableObject {
    
    @Published var moviesByUserResponse: TCMoviesByUserResponse?
    
    private let api = TwitCastingAPI()
    
    func getMoviesByUser(token: String, userId: String) async {
        
        do {
            
            let moviesByUserResponse = try await api.getMoviesByUser(token: token, userId: userId)
            
            DispatchQueue.main.async {
                self.moviesByUserResponse = moviesByUserResponse
            }
            
            print(moviesByUserResponse)
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
