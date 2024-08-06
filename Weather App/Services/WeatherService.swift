//
//  WeatherService.swift
//  Weather App
//
//  Created by The Seven Stallions on 20/06/22.
//

import Foundation
import UIKit

class WeatherService{
    
    func getWeather(city:String, completion: @escaping (ResponseBody?) -> ()){
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6c451218895b632fc91c25c22342d565") else {
            completion(nil)
            return
        }
        
        
        let urlRequest = URLRequest(url: url)
                
        URLSession.shared.dataTask(with: urlRequest){data, response, error in
           
            guard let data = data, error==nil else {
                completion(nil)
                return
            }
            let responseBody = try? JSONDecoder().decode(ResponseBody.self, from: data)
            
            print(responseBody)
            
            completion(responseBody)
        
            
        }.resume()
        
                       
    }
    func getWeatherByState(city:String, state:String, country:String, completion:@escaping(ResponseBody?)->()){
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city),\(state),\(country)&appid=6c451218895b632fc91c25c22342d565") else {
            completion(nil)
            return
        }
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city),\(country)&appid={API key}") else {
        
        let urlRequest = URLRequest(url: url)
                
        URLSession.shared.dataTask(with: urlRequest){data, response, error in
           
            guard let data = data, error==nil else {
                completion(nil)
                return
            }
            let responseBody = try? JSONDecoder().decode(ResponseBody.self, from: data)
            
            print(responseBody)
            
            completion(responseBody)
        
            
        }.resume()
        
        
    }
    
    
    func getCities(city:String, completion:@escaping ([CityResponse]?) -> ()){

        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=6c451218895b632fc91c25c22342d565") else {
            completion(nil)
            return
        }
        
        
        let urlRequest = URLRequest(url: url)
                
        URLSession.shared.dataTask(with: urlRequest){data, response, error in
           
            guard let data = data, error==nil else {
                completion(nil)
                return
            }
            let cityResponse = try? JSONDecoder().decode([CityResponse].self, from: data)
            
            print(cityResponse)
            
            completion(cityResponse)
        
            
        }.resume()
        
    }
    
    
    
}
