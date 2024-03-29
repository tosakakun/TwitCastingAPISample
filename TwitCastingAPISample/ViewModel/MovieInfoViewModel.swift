//
//  MovieInfoViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/04/25.
//

import Foundation
import TwitCastingAPI

@MainActor
class MovieInfoViewModel: ObservableObject {
    
    @Published var movieInfoResponse: TCMovieInfoResponse?
    
    private let api = TwitCastingAPI()
    
    func getMovieInfo(token: String, movieId: String) async {
        
        do {
            
            let movieInfoResponse = try await api.getMovieInfo(token: token, movieId: movieId)
            
            self.movieInfoResponse = movieInfoResponse
            
            print(movieInfoResponse)

        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
