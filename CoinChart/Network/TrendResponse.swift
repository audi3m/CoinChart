//
//  TrendResponse.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import Foundation
import SwiftUI

struct TrendResponse: Decodable {
    let coins: [Coin]
    let nfts: [NFT]
}

struct Coin: Decodable, Identifiable {
    let id = UUID()
    let item: Item
}

struct Item: Decodable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let small: String
    let data: CoinData
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case small
        case data
    }
    
    var image: URL? {
        URL(string: small)
    }
    
}

struct CoinData: Decodable {
     
    let price: Double
    let priceChange24h: PriceChange24h
    
    enum CodingKeys: String, CodingKey {
        case price
        case priceChange24h = "price_change_percentage_24h"
    }
    
    var priceDouble: String {
        "$" + String(format: "%.2f", price)
    }
}

struct PriceChange24h: Decodable {
    let krw: Double
    
    var krwDouble: String {
        if krw >= 0 {
            "+" + String(format: "%.2f", krw) + "%"
        } else {
            String(format: "%.2f", krw) + "%"
        }
    }
    
    var color: Color {
        if krw >= 0 {
            return Color.red
        } else {
            return Color.blue
        }
    }
}

struct NFT: Decodable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let data: NFTData
    
    var thumbImage: URL {
        URL(string: thumb)!
    }
    
}

struct NFTData: Decodable {
    
    let floorPrice: String
    let floorPrice24hChange: String
    
    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case floorPrice24hChange = "floor_price_in_usd_24h_percentage_change"
    }
    
    var priceChangeDouble: String {
        if let num = Double(floorPrice24hChange) {
            if num >= 0 {
                return "+" + String(format: "%.2f", num) + "%"
            } else {
                return String(format: "%.2f", num) + "%"
            }
        } else {
            return "???"
        }
    }
    
    var color: Color {
        if let num = Double(floorPrice24hChange) {
            if num >= 0 {
                return .red
            } else {
                return .blue
            }
        } else {
            return .blackAndWhite
        }
    }
    
    
}

extension [Coin] {
    func sortByChange() -> [Coin] {
        self.sorted { $0.item.data.priceChange24h.krw > $1.item.data.priceChange24h.krw}
    }
}

extension [NFT] {
    func sortByChange() -> [NFT] {
        self.sorted { $0.data.floorPrice24hChange > $1.data.floorPrice24hChange}
    }
}
