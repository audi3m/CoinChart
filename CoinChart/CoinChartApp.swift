//
//  CoinChartApp.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI

@main
struct CoinChartApp: App {
    var body: some Scene {
        WindowGroup {
            CoinTabView()
                .preferredColorScheme(.light)
        }
        
    }
}
