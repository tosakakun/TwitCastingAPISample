//
//  GetCategoriesVeiw.swift
//  TwitCastingAPISample
//
//  Created by tosakakun on 2022/05/06.
//

import SwiftUI
import TwitCastingAPI

struct GetCategoriesVeiw: View {
    
    @EnvironmentObject var auth: TwitCastingAuth
    
    @StateObject private var viewModel = GetCategoriesVeiwModel()
    
    var body: some View {
        
        VStack {
            
            Button {
                Task {
                    await viewModel.getCategories(token: auth.token)
                }
            } label: {
                Text("配信中のライブがあるカテゴリのみを取得")
            }

            if let response = viewModel.categoryResponse {
                
                List {
                    
                    ForEach(response.categories) { category in
                        
                        NavigationLink {
                            SubCategoryView(category: category)
                        } label: {
                            Text(category.name)
                        }
                        
                    }

                }
                .listStyle(.plain)

            }
            
            Spacer()

        }
        .navigationTitle("Get Categories テスト")
        
    }

}

struct GetCategoriesVeiw_Previews: PreviewProvider {
    static var previews: some View {
        GetCategoriesVeiw()
    }
}
