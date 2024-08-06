//
//  PlaceholderStyle.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import Foundation
import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .foregroundColor(.gray)
                .padding(.horizontal, 15)
            }
            content
                .foregroundColor(Color.black)
            .padding(5.0)
        }
    }
}
