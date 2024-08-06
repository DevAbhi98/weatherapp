//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by The Seven Stallions on 20/06/22.
//

import Foundation
import Combine
import SwiftUI

class WeatherViewModel:ObservableObject{
        
    private var weatherService:WeatherService!
    @Published var weatherResponse:ResponseBody?
    @Published var citiesResponse:[CityResponse]?
    
    @AppStorage("distanceUnit") var theDistanceUnit: String = "km"
    @AppStorage("temperatureUnit") var temperatureUnit:String = "Celsius"
    @AppStorage("windUnit") var theWindUnit:String = "km/h"
    

    var cities:[CityResponse]{
        return citiesResponse ?? []
    }
    
    init(){
        weatherService = WeatherService()
    }
    
    var temperature:String {
        if let temp = self.weatherResponse?.main.temp{
            
            switch(temperatureUnit){
                
            case "Celsius":
                return String(format: "%.0f"+"°C", temp-273.15.rounded())
            case "Kelvin":
                return String(format: "%.0f"+"K", temp)
            case "Fahrenheit":
                return String(format: "%.0f"+"°F", ((temp-273.15)*(9/5)+32).rounded())
            default:
                return String(format: "%.0f", temp-273.15.rounded())
                
            }
            
        }else{
            return "35"
        }
    }
    
    var country:String{
        return citiesResponse?[0].country ?? "No Country"
    }
    
    func getCurrentDate()-> String{
        
        let time = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd, MMM yyyy"
        let stringDate = timeFormatter.string(from: time)
        return stringDate
    }
    
    
    
    var humidity:String {
        if let humidity = self.weatherResponse?.main.humidity{
            return String(format: "%.0f", humidity.rounded())
        }else{
            return "20"
        }
    }
    
    var currentDate:String {
        return getCurrentDate()
    }

    var visibility:String{
        if let visibility = self.weatherResponse?.visibility{
            
            var finalvisibility:Double = Double((visibility/1000))/1.609344
            
            if(theDistanceUnit == "miles"){
                return String(format: "%.2f \(theDistanceUnit)", finalvisibility)
            }else{
                return String("\(visibility/1000) " + theDistanceUnit)
            }
   
        }else{
            return "5"
        }
    }
    
    var cityName:String = ""
    
    var theCountry:String{
        return self.weatherResponse?.sys.country ?? "In"
    }
    
    var city:String{
        return self.weatherResponse?.name ?? "Ahmedabad "
    }
    
    var weatherType:String{
        return self.weatherResponse?.weather[0].description ?? "Haze"
    }
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)
        }
    }
    
    func searchByCity(city:String){
        if let city = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)
        }
    }
    
    var weatherIcon:String{
        return weatherResponse?.weather[0].icon ?? "10d"
    }

    var max_temp:String{
        if let max_temp = self.weatherResponse?.main.temp_max{
            return String(format: "%.0f", max_temp-273.15)
        }else{
            return "30"
        }
    }
    
    var pressure:String{
        if let pressure = self.weatherResponse?.main.pressure{
            return String(format: "%.1f", pressure/1000)
        }else{
            return "30"
        }
    }
    

    var wind:String{
        if let wind = self.weatherResponse?.wind.speed{
            return String(format: "%.0f " + theWindUnit, wind*1.609344)
        }else{
            return "30"
        }
    }
    
    var min_temp:String{
        if let min_temp = self.weatherResponse?.main.temp_min{
            return String(format: "%.0f", min_temp-273.15)
        }else{
            return "30"
        }
    }
    
    
    var feels_like:String?{
        if let feels_like = self.weatherResponse?.main.temp_min{
            return String(format: "%.0f", feels_like-273.15.rounded())
        }else{
            return "30"
        }
    }

    private func fetchWeather(city:String){
        
        weatherService.getWeather(city: city, completion: { weather in
            
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weatherResponse = weather
                }
            }
            
        })
        
    }
    
    func fetchCities(city:String){
        
        weatherService.getCities(city: city, completion: { city in
            
            if let city = city {
                DispatchQueue.main.async {
                    self.citiesResponse = city
                }
            }
            
        })
        
        
    }
    
    func fetchWeatherByState(city:String, state:String, country:String){
        
        var theCity = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        var theState = state.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        var theCountry = country.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        print(theCity, theState, theCountry)
        
        weatherService.getWeatherByState(city: theCity,  state: theState, country:theCountry, completion: { weather in
            
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weatherResponse = weather
                }
            }
            
        })
        
    }
    
    
    
}
