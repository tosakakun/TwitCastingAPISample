//
//  MovieInfoViewModel.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/25.
//

import Foundation
import TwitCastingAPI

class MovieInfoViewModel: ObservableObject {
    
    @Published var movieInfoResponse: TCMovieInfoResponse?
    
    private let api = TwitCastingAPI()
    
    func getMovieInfo(token: String, movieId: String) async {
        
        do {
            
            let movieInfoResponse = try await api.getMovieInfo(token: token, movieId: movieId)
            
            DispatchQueue.main.async {
                self.movieInfoResponse = movieInfoResponse
            }
            
            print(movieInfoResponse)

        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
