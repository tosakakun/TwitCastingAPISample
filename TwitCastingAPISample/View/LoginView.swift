//
//  LoginView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/18.
//

import SwiftUI
import TwitCastingAPI

struct LoginView: View {
    
    @ObservedObject var auth: TwitCastingAuth

    var body: some View {
        
        Button {
            auth.login()
        } label: {
            Text("ツイキャスでログイン")
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(auth: TwitCastingAuth(clientId: "id", callbackURLScheme: "scheme"))
    }
}
