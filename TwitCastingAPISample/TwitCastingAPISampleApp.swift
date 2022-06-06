//
//  TwitCastingAPISampleApp.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/06/05.
//

import SwiftUI
import TwitCastingAPI

@main
struct TwitCastingAPISampleApp: App {
    
    @StateObject var auth = TwitCastingAuth(clientId: "YOUR_CLIENT_ID", callbackURLScheme: "YOUR_CALLBACK_URL_SCHEME")
    
    var body: some Scene {
        WindowGroup {
            
            if auth.token.isEmpty {
                LoginView(auth: auth)
            } else {
                APITestView()
                    .environmentObject(auth)
            }
        }
    }
}
