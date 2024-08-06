//
//  NewWeatherCard.swift
//  Weather App
//
//  Created by The Seven Stallions on 24/06/22.
//

import SwiftUI

struct NewWeatherCard: View {
    
    @ObservedObject var weatherVM:WeatherViewModel
    
    
    func getImage() -> String{
        
        switch(weatherVM.weatherIcon){
            
        case "0.1d":
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
        
        case "0.1n":
            return "night-cloud"
            
        case "02n":
            return "night-cloud"
            
        case "03n":
            return "cloud"
            
        case "04n":
            return "cloud-dark"
            
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
            return ""
            
        }
    }

    var body: some View {
        ZStack{
            
            HStack{
                Spacer()
                VStack{
                    
                                    
                    Text("Pressure")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("\(weatherVM.pressure) bar")
                        .font(.system(size: 28, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,1)
                    
                    Text("Humidity")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,40)
                    
                    Text("\(weatherVM.humidity)%")
                        .font(.system(size: 28, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,1)
                }
                .padding(.top)
                .padding(.bottom)
                
                Spacer()
                
                HStack{
                   
                   RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ColorTheme"))
                        .frame(width: 1, height: 200)
                        .opacity(1)
                                    
                }
                Spacer()
                
                VStack{
                    Text("Wind")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("\(weatherVM.wind)")
                        .font(.system(size: 28, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,1)
                    
                    Text("Visibility")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,40)
                    
                    Text("\(weatherVM.visibility)")
                        .font(.system(size: 28, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.top,1)
                                       
                }
                .padding(.top)
                .padding(.bottom)
                
                Spacer()
                
            }
            .padding()
            
        }.background(
            
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray))
                    .blendMode(.hardLight)
                    .opacity(0.3)
            }
            
 
        ).cornerRadius(20)
            .foregroundStyle(.ultraThinMaterial)
        
        
       
        
    }
}

struct NewWeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        NewWeatherCard(weatherVM: WeatherViewModel())
            .previewLayout(.sizeThatFits)
            .background(Color("ColorTheme"))
        
    }
}
