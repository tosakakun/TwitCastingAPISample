//
//  SupporterDetailView.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct SupporterDetailView: View {
    
    let user: TCSupporterUser
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    private var supported: String {
        
        formatter.string(from: Date(timeIntervalSince1970: TimeInterval(user.supported)))
        
    }
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: user.image)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
            } placeholder: {
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color.gray)
            }

            Text(user.name)
                .padding()
            
            Text(user.profile)
                .padding()
            
            Text("サポート日時: \(supported)")
            
            Spacer()
            
        }
        
    }
}

//struct SupporterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SupporterDetailView(user: TCSupporterUser(id: "1", screenId: "screen_id", name: "name", image: "url", profile: "プロファイル", level: 1, lastMovieId: "1234", isLive: false, supported: 1, supporterCount: 1, supportingCount: 1, point: 1, totalPoint: 1))
//    }
//}
