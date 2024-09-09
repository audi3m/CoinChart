//
//  NavigationLazyView.swift
//  CoinChart
//
//  Created by J Oh on 9/9/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let view: (() -> Content)
    
    init(_ view: @autoclosure @escaping () -> Content) {
        self.view = view
        print("NavigationLazyView init")
    }
    
    var body: some View {
        view()
    }
}
