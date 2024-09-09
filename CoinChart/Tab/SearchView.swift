//
//  SearchView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @State private var query = ""
    @State private var list = Dummy.search
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(list) { item in
                    
                    NavigationLink {
                        NavigationLazyView(ChartView())
                    } label: {
                        SearchRowCell(item: item)
                    }
                     
                }
            }
            .searchable(text: $query)
            .onSubmit(of: .search) {
                NetworkManager.shared.searchCoins(query: query) { response in
                    switch response {
                    case .success(let success):
                        print("Success")
                        list = success.coins
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchRowCell: View {
    let item: SearchItem
    var body: some View {
        HStack(spacing: 15) {
            KFImage(item.thumbURL)
                .placeholder { Image(systemName: "questionmark.circle") }
                .frame(width: 40, height: 40)
                .scaledToFit()
                .clipped()
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.subheadline).bold()
                    .lineLimit(1)
                Text(item.symbol)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .foregroundStyle(.blackAndWhite)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "star")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.purple)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    SearchView()
}
