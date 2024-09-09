//
//  NetworkManager.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func trendRequest(handler: @escaping (Result<TrendResponse, Error>) -> Void) {
        if let url = URL(string: "https://api.coingecko.com/api/v3/search/trending") {
            AF.request(url).responseDecodable(of: TrendResponse.self) { response in
                switch response.result {
                case .success(let success):
                    handler(.success(success))
                case .failure(let failure):
                    handler(.failure(failure))
                }
            }
        }
    }
    
    func searchCoins(query: String, handler: @escaping (Result<CoinSearchResponse, Error>) -> Void) {
        if let url = URL(string: "https://api.coingecko.com/api/v3/search?query=\(query)") {
            AF.request(url).responseDecodable(of: CoinSearchResponse.self) { response in
                switch response.result {
                case .success(let success):
                    handler(.success(success))
                case .failure(let failure):
                    handler(.failure(failure))
                }
            }
        }
    }
    
    func marketRequest(coinID: String, currency: String, handler: @escaping (Result<MarketResponse, Error>) -> Void) {
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(currency)&ids=\(coinID)") {
            AF.request(url).responseDecodable(of: MarketResponse.self) { response in
                switch response.result {
                case .success(let success):
                    handler(.success(success))
                case .failure(let failure):
                    handler(.failure(failure))
                }
            }
        }
    }
    
    
    
}
