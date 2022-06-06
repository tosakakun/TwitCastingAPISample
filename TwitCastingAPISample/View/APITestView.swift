//
//  APITestView.swift
//  TwitCastingAPIDev
//
//  Created by tosakakun on 2022/04/18.
//

import SwiftUI
import TwitCastingAPI

struct APITestView: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    /// ログインしているユーザー名
    var name: String? {
        auth.credentialResponse?.user.name
    }
    
    var body: some View {
        
        NavigationView {
            
            List {

                Group {
                    NavigationLink {
                        GetUserInfoView()
                    } label: {
                        Text("Get User Info")
                    }

                    NavigationLink {
                        VerifyCredentialsView()
                    } label: {
                        Text("Verify Credentials")
                    }

                    NavigationLink {
                        LiveThumbnailImageView()
                    } label: {
                        Text("Get Live Thumbnail Image")
                    }

                    NavigationLink {
                        MovieInfoView()
                    } label: {
                        Text("Get Movie Info")
                    }

                    NavigationLink {
                        MoviesByUserView()
                    } label: {
                        Text("Get Movies by User")
                    }

                    NavigationLink {
                        CurrentLiveView()
                    } label: {
                        Text("Get Current Live")
                    }

                    NavigationLink {
                        CurrentLiveSubtitleView()
                    } label: {
                        Text("Set or Unset Current Live Subtitle")
                    }

                    NavigationLink {
                        CurrentLiveHashtagView()
                    } label: {
                        Text("Set or Unset Current Live Hashtag")
                    }

                    NavigationLink {
                        GetCommentsView()
                    } label: {
                        Text("Get Comments")
                    }

                    NavigationLink {
                        PostDeleteCommentView()
                    } label: {
                        Text("Post Delete Commnet")
                    }
                }
                
                Group {
                    
                    NavigationLink {
                        GiftsView()
                    } label: {
                        Text("Get Gifts")
                    }
                    
                    NavigationLink {
                        SupportingStatusView()
                    } label: {
                        Text("Get Supporting Status")
                    }
                    
                    NavigationLink {
                        SupportUnsupportUserView()
                    } label: {
                        Text("Support and Unsupport User")
                    }
                    
//                    NavigationLink {
//                        SupportingListView()
//                    } label: {
//                        Text("Supporting List")
//                    }
//                    
//                    NavigationLink {
//                        SupporterListView()
//                    } label: {
//                        Text("Supporter List")
//                    }
//                    
//                    NavigationLink {
//                        GetCategoriesVeiw()
//                    } label: {
//                        Text("Get Categories")
//                    }
//                    
//                    NavigationLink {
//                        SearchUsersView()
//                    } label: {
//                        Text("Search Users")
//                    }
//                    
//                    NavigationLink {
//                        SearchLiveMoviesView()
//                    } label: {
//                        Text("Search Live Movies")
//                    }
//                    
//                    NavigationLink {
//                        BroadcastingView()
//                    } label: {
//                        Text("Get RTMP, WebM Url")
//                    }
//
                }

            }
            .listStyle(.plain)
            .navigationTitle("API テスト (\(name ?? "名無しさん"))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        auth.logout()
                    } label: {
                        Text("ログアウト")
                    }

                }
            }
            
        }
    }
}

struct APITestView_Previews: PreviewProvider {
    static var previews: some View {
        APITestView()
    }
}
