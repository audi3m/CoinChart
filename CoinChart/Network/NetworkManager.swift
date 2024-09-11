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
    
    func request<T: Decodable>(target: T.Type, type: CoinRequest) async throws -> T {
        let request = URLRequest(url: type.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CoinError.invalidResponse
        }
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Here")
            throw CoinError.decodeError
        }
    }
    
//    func trendRequest(handler: @escaping (Result<TrendResponse, Error>) -> Void) {
//        if let url = URL(string: "https://api.coingecko.com/api/v3/search/trending") {
//            AF.request(url).responseDecodable(of: TrendResponse.self) { response in
//                switch response.result {
//                case .success(let success):
//                    handler(.success(success))
//                case .failure(let failure):
//                    handler(.failure(failure))
//                }
//            }
//        }
//    }
//    
//    func searchCoins(query: String, handler: @escaping (Result<CoinSearchResponse, Error>) -> Void) {
//        if let url = URL(string: "https://api.coingecko.com/api/v3/search?query=\(query)") {
//            AF.request(url).responseDecodable(of: CoinSearchResponse.self) { response in
//                switch response.result {
//                case .success(let success):
//                    handler(.success(success))
//                case .failure(let failure):
//                    handler(.failure(failure))
//                }
//            }
//        }
//    }
//    
//    func marketRequest(coinID: String, currency: String, handler: @escaping (Result<MarketResponse, Error>) -> Void) {
//        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(currency)&ids=\(coinID)") {
//            AF.request(url).responseDecodable(of: MarketResponse.self) { response in
//                switch response.result {
//                case .success(let success):
//                    handler(.success(success))
//                case .failure(let failure):
//                    handler(.failure(failure))
//                }
//            }
//        }
//    }
     
    
    
}


// enum {
extension NetworkManager {
    enum CoinError: String, Error {
        case invalidResponse
        case unknown
        case decodeError
    }
    
    enum CoinRequest {
        case trend
        case search(query: String)
        case market(currency: String, coinID: String)
        
        var url: URL {
            switch self {
            case .trend:
                URL(string: "https://api.coingecko.com/api/v3/search/trending")!
            case .search(let query):
                URL(string: "https://api.coingecko.com/api/v3/search?query=\(query)")!
            case .market(let currency, let coinID):
                URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(currency)&ids=\(coinID)")!
            }
        }
    }
}
