//
//  CoinSearchResponse.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import Foundation

struct CoinSearchResponse: Decodable {
    let coins: [SearchItem]
}

struct SearchItem: Decodable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    
    var thumbURL: URL? {
        URL(string: thumb)
    }
}
