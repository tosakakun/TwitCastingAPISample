# TwitCastingAPISample
Sample App for [TwitCasting API v2 Client library](https://github.com/tosakakun/TwitCastingAPI).
This App is not convenience but you can know how to use the [TwitCasting API v2 Client library](https://github.com/tosakakun/TwitCastingAPI).

## Usage
1. You have to generate your client id and set Callback URL via the [Developer page](https://twitcasting.tv/developer.php). 
Make sure to set the appropriate scope.
1. Open TwitCastingAPISampleApp.swift and replace YOUR_CLIENT_ID and YOUR_CALLBACK_URL_SCHEME with your own.

```Swift
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
```
