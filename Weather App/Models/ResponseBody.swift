//
//  ResponseBody.swift
//  Swift Weather App
//
//  Created by The Seven Stallions on 24/06/22.
//

import Foundation


struct ResponseBody:Decodable{
    
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var visibility:Int
    var sys:Sys
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct Sys:Decodable{
        var type:Int?
        var id:Int?
        var country:String?
        var sunrise:Int?
        var sunset:Int?
    }
    
    struct CoordinatesResponse: Decodable {
        var lon: Double?
        var lat: Double?
    }

    struct WeatherResponse: Decodable {
        var id: Double?
        var main: String?
        var description: String?
        var icon: String?
    }

    struct MainResponse: Decodable {
        var temp: Double?
        var feels_like: Double?
        var temp_min: Double?
        var temp_max: Double?
        var pressure: Double?
        var humidity: Double?
        var sea_level:Double?
        var grnd_level:Double?
    }
    
    struct WindResponse: Decodable {
        var speed: Double?
        var deg: Double?
        var gust:Double?
    }

    
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like! }
    var tempMin: Double { return temp_min! }
    var tempMax: Double { return temp_max! }
}
