//
//  LargeWeatherCiryCardView.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct LargeWeatherCiryCardView: View {
    var body: some View {
        
        HStack {
            VStack{
                Text("Ahmedabad")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                Image("thunder-with-rain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
                HStack{
                    
                    Text("13")
                        .foregroundColor(Color.white)
                        .font(.title)
                    
                    Text("Thunder")
                        .foregroundColor(Color.white)
                    
                }
                
            }
            Spacer()
        }
        .frame(width:.infinity)
        .background(
        
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("ColorTheme"))
                .blendMode(.hardLight)
                .opacity(0.5)
                .background(Color.white)
                .opacity(0.4)
        }
        ).cornerRadius(20)
            .foregroundStyle(.ultraThinMaterial)
        
    }
}

struct LargeWeatherCiryCardView_Previews: PreviewProvider {
    static var previews: some View {
        LargeWeatherCiryCardView()
    }
}
