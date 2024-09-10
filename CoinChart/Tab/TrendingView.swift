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
                VStack(spacing: 40) {
                    MyFavoriteSectionView()
                    Top15CoinSectionView()
                    Top7NFTSectionView()
                }
                .padding(.top, 20)
            }
            .navigationTitle("Crypto Coin")
        }
    }
}

struct MyFavoriteSectionView: View {
    var body: some View {
        VStack {
            Text("My Favorites")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { _ in
                        MyFavoriteCell()
                    }
                    
                    Text("더보기")
                        .padding()
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct MyFavoriteCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "bitcoinsign.circle")
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text("Bitcoin")
                        .font(.subheadline)
                        .bold()
                    Text("BTC")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(12)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("₩69,234,245")
                    .font(.subheadline)
                    .bold()
                Text("+0.64%")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(.red)
            }
            .padding(12)
        }
        .frame(width: 180, height: 130, alignment: .leading)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Top15CoinSectionView: View {
    var body: some View {
        VStack {
            Text("Top 15 Coin")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    VStack {
                        RankCell()
                        Divider()
                        RankCell()
                        Divider()
                        RankCell()
                    }
                    
                    VStack {
                        RankCell()
                        Divider()
                        RankCell()
                        Divider()
                        RankCell()
                    }
                    
                    VStack {
                        RankCell()
                        Divider()
                        RankCell()
                        Divider()
                        RankCell()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct Top7NFTSectionView: View {
    var body: some View {
        VStack {
            Text("Top 7 NFT")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 24) {
                    VStack {
                        RankCell()
                        Divider()
                        RankCell()
                        Divider()
                        RankCell()
                    }
                    
                    VStack {
                        RankCell()
                        Divider()
                        RankCell()
                        Divider()
                        RankCell()
                    }
                    
                    VStack {
                        RankCell()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct RankCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Text("1")
                .font(.title)
                .bold()
            
            HStack {
                Image(systemName: "bitcoinsign.circle")
                    .font(.title)
                VStack(alignment: .leading) {
                    Text("Bitcoin")
                        .font(.subheadline)
                        .bold()
                    Text("BTC")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            VStack {
                Text("$0.4175")
                Text("+21.18%")
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
        .frame(width: 320, height: 50)
    }
}

#Preview {
    TrendingView()
}
