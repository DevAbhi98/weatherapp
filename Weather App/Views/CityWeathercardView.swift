//
//  CityWeathercardView.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct CityWeathercardView: View {

    @ObservedObject var weatherVM:WeatherViewModel = WeatherViewModel()
    
    var city:String
    
    init(city:String){
        self.city = city
        weatherVM.searchByCity(city: city)
    }
    
    func getImage() -> String{
        
        switch(weatherVM.weatherIcon){
            
        case "01d":
            return "sun"
            
        case "02d":
            return "sun-cloud"
            
        case "03d":
            return "cloud"
            
        case "04d":
            return "dark-clouds"
            
        case "09d":
            return "rain-cloud"
            
        case "10d":
            return "rain-sun"
            
        case "11d":
            return "thunder-with-rain"
            
        case "13d":
            return "very-low-temperature"
            
        case "50d":
            return "sun-smoke"
        
        case "01n":
            return "night-cloud"
            
        case "02n":
            return "night-cloud"
            
        case "03n":
            return "cloud"
            
        case "04n":
            return "could-dark"
            
        case "09n":
            return "rain-cloud"
            
        case "10n":
            return "rain-cloud"
            
        case "11n":
            return "thunder-with-rain"
            
        case "13n":
            return "very-low-temperature"
            
        case "50n":
            return "sun-smoke"
            
        default:
            return "sun-smoke"
            
        }
    }
    
    var body: some View {
        VStack{
            Text(weatherVM.city)
                .font(.title2)
                .foregroundColor(Color.white)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Image(getImage())
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Text(weatherVM.temperature)
                .foregroundColor(Color.white)
                    .font(.system(size: 35))
                
            Text(weatherVM.weatherType.capitalized)
                .foregroundColor(Color.white)
          
        }
        .padding(.leading,10)
        .padding(.trailing, 10)
        .padding(.bottom,10)
        .padding(.top, 10)
        .fixedSize(horizontal: true, vertical: true)
        .frame(width: 190, height: 220, alignment: .center)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("ColorTheme"))
                    .blendMode(.hardLight)
                    .opacity(0.8)
            }
        )
        .cornerRadius(20)
            .foregroundStyle(.ultraThinMaterial)
            
    }
}

struct CityWeathercardView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeathercardView(city: "Ahmedabad")
            .previewLayout(.sizeThatFits)
    }
}
