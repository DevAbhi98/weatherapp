//
//  WeatherCard.swift
//  Weather App
//
//  Created by The Seven Stallions on 21/06/22.
//

import SwiftUI

struct WeatherCard: View {
    
    @ObservedObject var weatherVM:WeatherViewModel
    @ObservedObject var imageLoader = ImageLoader()
    
    func getImage() {
        imageLoader.downlaodImage(image: weatherVM.weatherIcon)
    }
    
    init(weatherVM:WeatherViewModel){
        self.weatherVM = weatherVM
        self.imageLoader.downlaodImage(image: weatherVM.weatherIcon)
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 0){
                VStack(alignment: .leading, spacing: 0){
                    
                    Text("\(weatherVM.currentDate)")
                        .font(.system(size: 15, design: .rounded))
                        .font(.footnote)
                    
                    Text("\(weatherVM.city), \(weatherVM.country)")
                        .font(.title)
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 50, height: 2)
                        .cornerRadius(20)
                        .padding(.top, 5)
                }
                
                Spacer()
                
                HStack{
    
                    if let data = self.imageLoader.downloadedData{
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 52, height: 52, alignment: .leading)
                    }else{
                        	Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45, alignment: .leading)
                                .fixedSize()
                    }
                    
                    Text("\(weatherVM.temperature)°C")
                        .font(.title)
                        .fixedSize()
                }
                .padding(.top,4)
                
                Spacer()
                
                HStack{
                    
                    Text("\(weatherVM.max_temp)°C / \(weatherVM.min_temp)°C. Feels like \(weatherVM.feels_like ?? " ")°C.")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .fixedSize()
                    
                    Text("\((weatherVM.weatherType).capitalized)")
                        .font(.headline)
                        .fixedSize()
                    
                }
                
                
                HStack {
                    VStack{
                        Rectangle()
                            .frame(width: 5, height: 20)
                            .cornerRadius(20)
                            .foregroundColor(Color.orange)
                    }
                    
                    Text("Humidity: \(weatherVM.humidity)%")
                    
                    VStack{
                        Rectangle()
                            .frame(width: 5, height: 20)
                            .cornerRadius(20)
                            .foregroundColor(Color.orange)
                    }
                    
                    Text("Visibility: \(weatherVM.visibility) km")
                    
                }
                .padding(.top,12)
        
                Spacer()
                
            }
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 10, trailing: 30))
            .frame(width: 400, height: 260, alignment: .leading)
        }
        .background(
            
            ZStack{
                Image("sunny")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .background(
                        Color.white
                    )
                    .cornerRadius(20)
                    
            }
            
            
        ).cornerRadius(20)
        
        
            
        
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weatherVM: WeatherViewModel())
            .previewLayout(.sizeThatFits)
    }
}
