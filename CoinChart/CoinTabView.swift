//
//  CoinTabView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI

struct CoinTabView: View {
    var body: some View {
        TabView {
            TrendingView()
                .tabItem { Image(systemName: "trophy") }
            
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            
            FavoriteView()
                .tabItem { Image(systemName: "star") }
            
            ProfileView()
                .tabItem { Image(systemName: "person") }
        }
    }
}

#Preview {
    CoinTabView()
}
