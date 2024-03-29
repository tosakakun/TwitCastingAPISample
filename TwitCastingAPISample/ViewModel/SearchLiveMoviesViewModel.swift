//
//  SearchLiveMoviesViewModel.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/07.
//

import Foundation
import TwitCastingAPI

@MainActor
class SearchLiveMoviesViewModel: ObservableObject {
    
    @Published var liveMoviesResponse: TCLiveMoviesResponse?
    
    private let api = TwitCastingAPI()
    
    func searchLiveMovies(token: String, type: TwitCastingAPI.LiveMoviesType, context: String?, lang: TwitCastingAPI.LiveMoviesLang = .ja) async {
        
        do {
            
            let response = try await api.searchLiveMovies(token: token, type: type, context: context)
            
            self.liveMoviesResponse = response
            
        } catch let error as TCError {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }

    }

}
