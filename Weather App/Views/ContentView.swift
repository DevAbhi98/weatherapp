//
//  ContentView.swift
//  Weather App
//
//  Created by The Seven Stallions on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("currentCity") var currentCity:String = "Ahmedabad"
    @AppStorage("currentState") var currentState:String = "Gujarat"
    @AppStorage("currentCountry") var currentCountry:String = "IN"
    @ObservedObject var weatherVM:WeatherViewModel
    
    init(){
        self.weatherVM = WeatherViewModel()
        weatherVM.fetchWeatherByState(city: currentCity, state: currentState, country: currentCountry)
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
            return ""
            
        }      
    }
    
    
    var body: some View {

            ZStack(alignment:.leading){
                
                
                Color("ColorTheme").ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        Image(getImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .padding(.top,150)
    
                        Spacer()
                    }
                    
                    Text(weatherVM.weatherType.capitalized)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .font(.footnote)
                        .padding(.top, 30)
                    
                    Text("\(weatherVM.temperature)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 80, design: .rounded))
                        .font(.footnote)
                    
                    NewWeatherCard(weatherVM: weatherVM)
                        .padding()
                    
                }
                

                VStack {
                    VStack{
                        
                        HStack{
                            Text("\(weatherVM.currentDate)")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, design: .rounded))
                                .font(.footnote)
                            Spacer()
                        }
                        
                        
                        HStack {
                            Text("\(currentCity), \(currentState), \(currentCountry)")
                                .foregroundColor(Color.white)
                            .font(.title)
                            Spacer()
                        }
                        
                       
                    }.padding(EdgeInsets(top: 40, leading: 40, bottom: 0, trailing: 0))
                    
                    ZStack{
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.2)
                            .padding(.top,50
                            )

                        
                    }
  
                  Spacer()

                    
                }
            
            }
            .onAppear{
                
                weatherVM.fetchWeatherByState(city: currentCity, state: currentState,  country: currentCountry)
                
            }
            .preferredColorScheme(.dark)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
