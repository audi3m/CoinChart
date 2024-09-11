//
//  TrendingView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI
import Kingfisher

struct TrendingView: View {
    @State private var coinRankList = [Coin]()
    @State private var nftRankList = [NFT]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    MyFavoriteSectionView()
                    Top15CoinSectionView(list: coinRankList)
                    Top7NFTSectionView(list: nftRankList)
                }
                .padding(.top, 20)
                .padding(.bottom, 100)
            }
            .navigationTitle("Crypto Coin")
            .task {
                Task {
                    do {
                        let result = try await NetworkManager.shared.request(target: TrendResponse.self, type: .trend)
                        coinRankList = result.coins.sortByChange()
                        nftRankList = result.nfts
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
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
            
            ScrollView(.horizontal) {
                HStack {
                    MyFavoriteCell()
                    MyFavoriteCell()
                }
            }
            
        }
    }
    
}

struct MyFavoriteCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "bitcoinsign.circle")
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
    let list: [Coin]
    var body: some View {
        VStack {
            Text("Top 15 Coin")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: .init(.flexible()), count: 3), content: {
                    ForEach(Array(list.enumerated()), id: \.element.id) { idx, coin in
                        CoinRankCell(rank: idx+1, item: coin.item)
                    }
                })
            }
        }
    }
    
}

struct Top7NFTSectionView: View {
    let list: [NFT]
    var body: some View {
        VStack {
            Text("Top 7 NFT")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: .init(.flexible()), count: 3), content: {
                    ForEach(Array(list.enumerated()), id: \.element.id) { idx, nft in
                        NFTRankCell(rank: idx+1, nft: nft)
                    }
                })
            }
            
        }
    }
    
}

struct CoinRankCell: View {
    let rank: Int
    let item: Item
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 12) {
                Text("\(rank)")
                    .font(.title)
                    .bold()
                
                HStack {
                    KFImage(item.image)
                        .placeholder { Image(systemName: "questionmark.circle") }
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.subheadline)
                            .bold()
                        Text(item.symbol)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(item.data.priceDouble)
                    Text(item.data.priceChange24h.krwDouble)
                        .font(.footnote)
                        .foregroundStyle(item.data.priceChange24h.color)
                }
            }
            .frame(width: 300, height: 50)
            
            if rank % 3 != 0 {
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

struct NFTRankCell: View {
    let rank: Int
    let nft: NFT
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 12) {
                Text("\(rank)")
                    .font(.title)
                    .bold()
                
                HStack {
                    KFImage(nft.thumbImage)
                        .placeholder { Image(systemName: "questionmark.circle") }
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(nft.name)
                            .font(.subheadline)
                            .bold()
                        Text(nft.symbol)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(nft.data.floorPrice)
                    Text(nft.data.priceChangeDouble)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
            }
            .frame(width: 300, height: 50)
            
            if rank % 3 != 0 {
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TrendingView()
}
