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
                .tag(0)
            
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            FavoriteView()
                .tabItem { Image(systemName: "star") }
                .tag(2)
            
            ProfileView()
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
    }
}

#Preview {
    CoinTabView()
}
