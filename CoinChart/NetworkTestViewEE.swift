//
//  NetworkTestViewEE.swift
//  CoinChart
//
//  Created by J Oh on 9/11/24.
//

import SwiftUI

struct NetworkTestViewEE: View {
    var body: some View {
        ScrollView {
            Text("Hello")
            Button("request") {
                NetworkManager.shared.trendRequest { response in
                    switch response {
                    case .success(let success):
                        print(success)
                    case .failure(let failure):
                        print("Fail")
                    }
                }
            }
        }
    }
}

#Preview {
    NetworkTestViewEE()
}
