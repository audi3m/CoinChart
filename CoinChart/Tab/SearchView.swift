//
//  SearchView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI

struct SearchView: View {
    @State private var query = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }
            .searchable(text: $query)
            .navigationTitle("Search")
        }
    }
}

struct SearchRowView: View {
//    let coin: Coin
    var body: some View {
        HStack {
            Image(systemName: "bitcoinsign")
            VStack {
                Text("Bitcoin")
                Text("BTC")
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "star")
            }
        }
    }
}

#Preview {
    SearchView()
}
