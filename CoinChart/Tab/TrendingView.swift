//
//  TrendingView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI 

struct TrendingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("")
            }
            .navigationTitle("Crypto Coin")
        }
    }
}

struct Top15CoinView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
            }
        }
    }
    
}

#Preview {
    TrendingView()
}
