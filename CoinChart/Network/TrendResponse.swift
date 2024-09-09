//
//  TrendResponse.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import Foundation

struct TrendResponse: Decodable {
    let coins: [Coin]
    let nfts: [NFT]
}

struct Coin: Decodable {
    let item: Item
}

struct Item: Decodable, Identifiable {
    let id: String
//    let coinID: Int
    let name: String
    let symbol: String
//    let marketCapRank: Int
//    let thumb: String
    let small: String
//    let large: String
//    let slug: String
//    let priceBTC: Double
//    let score: Int
    let data: CoinData
    
    enum CodingKeys: String, CodingKey {
        case id
//        case coinID = "coin_id"
        case name
        case symbol
//        case marketCapRank = "market_cap_rank"
//        case thumb
        case small
//        case large
//        case slug
//        case priceBTC = "price_btc"
//        case score
        case data
    }
    
}

struct CoinData: Decodable {
    
//    let price: Double
//    let priceBTC: String
    let priceChange24h: KRW
//    let marketCap: String
//    let marketCapBTC: String
//    let totalVolume: String
//    let totalVolumeBTC: String
//    let sparkline: String
//    let content: CoinContent?
    
    enum CodingKeys: String, CodingKey {
//        case price
//        case priceBTC = "price_btc"
        case priceChange24h = "price_change_percentage_24h"
//        case marketCap = "market_cap"
//        case marketCapBTC = "market_cap_btc"
//        case totalVolume = "total_volume"
//        case totalVolumeBTC = "total_volume_btc"
//        case sparkline
//        case content
    }
}

struct KRW: Decodable {
    let krw: Double
    
    var krwDouble: String {
        String(format: "%.2f", krw)
    }
}

//struct CoinContent: Decodable {
//    let title: String
//    let description: String
//}

struct NFT: Decodable {
    
//    let id: String
    let name: String
    let symbol: String
    let thumb: String
//    let nft_contract_id: Int
//    let native_currency_symbol: String
//    let floor_price_in_native_currency: Double
//    let floor_price_24h_percentage_change: Double
    let data: NFTData
    
}

struct NFTData: Decodable {
    
    let floorPrice: String
    let floorPrice24hChange: String
//    let h24_volume: String
//    let h24_average_sale_price: String
//    let sparkline: String
//    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case floorPrice24hChange = "floor_price_in_usd_24h_percentage_change"
    }
    
    var priceChangeDouble: String {
        String(format: "%.2f", floorPrice24hChange)
    }
}
