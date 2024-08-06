//
//  ImageLoader.swift
//  Weather App
//
//  Created by The Seven Stallions on 22/06/22.
//

import Foundation
import SwiftUI
import UIKit

class ImageLoader: ObservableObject{
    
    @Published var downloadedData:Data?

    func downlaodImage(image:String){
        
        guard let imageURL = URL(string: "https://openweathermap.org/img/wn/\(image)@2x.png") else{
            return
        }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }).resume()
        
        
    }
    
}
