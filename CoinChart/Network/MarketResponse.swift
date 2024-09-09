//
//  MarketResponse.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import Foundation

struct MarketResponse: Decodable {
    
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: String
    let high24h: String
    let low24h: String
    let priceChange24h: String
    let ath: String
    let athDate: String
    let atl: String
    let atlDate: String
    let lastUpdated: String
    let sparkline7d: sparkline
//    let market_cap: String
//    let market_cap_rank: String
//    let fully_diluted_valuation: String
//    let total_volume: String
//    let price_change_24h: String
//    let market_cap_change_24h: String
//    let market_cap_change_percentage_24h: String
//    let circulating_supply: String
//    let total_supply: String
//    let max_supply: String
//    let ath_change_percentage: String
//    let atl_change_percentage: String
//    let roi: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_percentage_24h"
        case ath
        case athDate = "ath_date"
        case atl
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparkline7d = "sparkline_in_7d"
    }
    
}

struct sparkline: Decodable {
    let price: [Double]
}
