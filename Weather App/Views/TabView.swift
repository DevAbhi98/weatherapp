//
//  TabView.swift
//  Weather App
//
//  Created by The Seven Stallions on 24/06/22.
//

import SwiftUI

struct FeaturedTabView: View {
    
    @ObservedObject var weatherVM:WeatherViewModel
    @ObservedObject var weatherVMMumbai:WeatherViewModel
    @ObservedObject var weatherVMKolkata:WeatherViewModel
    
    var body: some View {

        VStack(spacing:0){
            TabView {

                
                WeatherCard(weatherVM: weatherVM)
                        .padding()
                WeatherCard(weatherVM: weatherVMKolkata)
                        .padding()
                WeatherCard(weatherVM: weatherVMMumbai)
                        .padding()
           

            }//tabview
            
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .frame(width: .infinity, height: 280, alignment: .leading)
        
        
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView(weatherVM: WeatherViewModel(), weatherVMMumbai: WeatherViewModel(), weatherVMKolkata: WeatherViewModel())
            .previewLayout(.sizeThatFits)
    }
}
