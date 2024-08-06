//
//  SearchView.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchedText:String = ""
    @AppStorage("searchItem") var searchItem = ""
    @AppStorage("searchedClick") var searchedItem:Bool = false
//    @ObservedObject var weatherVMKolkata:WeatherViewModel
//    @ObservedObject var weatherVMMumbai:WeatherViewModel
//    @ObservedObject var weatherVMDelhi:WeatherViewModel
//    @ObservedObject var weatherVMNewyork:WeatherViewModel
//    @ObservedObject var weatherVM:WeatherViewModel
    
    var weatherCardList:[String] = ["Ahmedabad"]
    
    func removeAllList(){
//        weatherCardList.removeAll()
    }
    
    mutating func addElement(element:String){
        weatherCardList.append(element)
    }
    
    
    let columns = [
        GridItem(.flexible(), spacing: 50),
                GridItem(.flexible(), spacing: 50)
        ]
    
    init() {

//        self.weatherVMKolkata = WeatherViewModel()
//        self.weatherVMMumbai = WeatherViewModel()
//        self.weatherVMDelhi = WeatherViewModel()
//        self.weatherVMNewyork = WeatherViewModel(
//        )
//        weatherVMMumbai.searchByCity(city: "Mumbai")
//        weatherVMKolkata.searchByCity(city: "Kolkata")
//        weatherVMDelhi.searchByCity(city: "Delhi")
//        weatherVMNewyork.searchByCity(city: "New York")
        
        
        
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func searchCity(weatherCard:WeatherViewModel, city:String){
//        weatherVMMumbai.searchByCity(city: city)
    }
    
    var body: some View {
        NavigationView{
            
            ZStack {

                Color("ColorTheme")
                    .ignoresSafeArea()
                
                Image("map")
                    .resizable()
                    .scaledToFit()
                    .offset( y: -150)
                    .opacity(0.3)
                    .blur(radius: 2, opaque: false)
                
                
                VStack{

                    VStack{
                        HStack{
                            Image(systemName:   "magnifyingglass")
                                .foregroundColor(Color.white)
                                           
                            TextField("",  text: $searchedText){
                                //do some task
                            }
                            .padding(.leading,6)
                            .foregroundColor(Color.white)
                            .accentColor(.white)
                            .modifier(PlaceholderStyle(showPlaceHolder: searchedText.isEmpty, placeholder: "Search a city"))
                            Spacer()
                            
                            Button(action: {
                                searchItem = searchedText
                                searchedItem = true
                            }, label: {
                                Text("Search")
                                    .foregroundColor(Color.white)
                            })
                            
                        }
                        .padding(.top, 10)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom,10)
                        .background(
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemGray))
                                .blendMode(.hardLight)
                                .opacity(0.4)
                        }
                        ).cornerRadius(20)
                            .foregroundStyle(.ultraThinMaterial)
                            
                    }    .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)

                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing:10) {

                            ForEach(weatherCardList, id: \.self){ weatherCard in
                                CityWeathercardView(city: searchItem)
                            }
 
                        }
                        .padding(.horizontal)
                        
                    }
                    
                           
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                    
                    
                    
                    Spacer()
                    
                }.navigationBarTitle("Search a city", displayMode: .inline)
                    
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
