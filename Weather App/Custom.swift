//
//  Custom.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct Custom: View {
    let data = (1...100).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible()),
                GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .padding(.horizontal)
                }
    
    }
}

struct Custom_Previews: PreviewProvider {
    static var previews: some View {
        Custom()
    }
}
