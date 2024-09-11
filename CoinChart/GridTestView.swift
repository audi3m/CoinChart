//
//  GridTestView.swift
//  CoinChart
//
//  Created by J Oh on 9/11/24.
//

import SwiftUI

struct GridTestView: View {
    let listA = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    let listB = [1,2,3,4,5,6,7]
    
    @State private var list = [Int]()
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: Array(repeating: .init(.flexible()), count: 3), content: {
                    ForEach(list, id: \.self) { idx in
                        TestCell(rank: idx)
                    }
                })
            }
            .frame(height: 300)
            
            HStack {
                Button("7") { list = listB }
                Button("15") { list = listA }
                
            }
        }
    }
    
}

struct TestCell: View {
    let rank: Int
    var body: some View {
        HStack {
            Text("\(rank)")
            Text("Bitcoin")
            Spacer()
            Image(systemName: "star")
        }
        .frame(width: 300, height: 50)
        .padding(12)
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    GridTestView()
}
