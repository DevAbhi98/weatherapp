//
//  SearchSheet.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct SearchSheet: View {
    
    @AppStorage("currentCity") var currentCity:String = "Ahmedabad"
    @AppStorage("currentState") var currentState:String = "Gujarat"
    @AppStorage("currentCountry") var currentCountry:String = "IN"
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var weatherVM:WeatherViewModel
    private var weatherService:WeatherService!
    private var cityList:[CityResponse] = [CityResponse]()
    
    mutating func addElement(city:CityResponse){
        cityList.append(city)
    }
    
    init() {
        weatherService = WeatherService()
        weatherVM = WeatherViewModel()
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    @State var searchedText:String  = ""
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Color("ColorTheme")
                    .ignoresSafeArea()
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
                            .accentColor(Color.gray)
                            .modifier(PlaceholderStyle(showPlaceHolder: searchedText.isEmpty, placeholder: "Search a city"))
                            Spacer()
                            
                            Button(action: {
                                weatherVM.fetchCities(city: searchedText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
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
                            
                    }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)
                    
                    ForEach(weatherVM.cities, id:\.state){ city in
                        VStack(alignment:.leading, spacing: 0){

                            HStack{
                                Text("\(city.name!), \(city.state!), \(city.country!)")
                                    .foregroundColor(Color.white)
                                Spacer()
                      
                            }
                            .onTapGesture {
                                currentCity = city.name!
                                currentState = city.state!
                                currentCountry = city.country!
                                presentationMode.wrappedValue.dismiss()
                            }
                            .padding(.leading, 10)
                            .padding(.top, 5)
                            .padding(.trailing, 10)
  
                        }
                        .padding()
                        .background(
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color("ColorTheme"))
                                    .blendMode(.hardLight)
                                    .opacity(0.8)
                            }
                        )
                        .padding(.leading)
                        .padding(.trailing)
                        .cornerRadius(20)
                        .foregroundStyle(.ultraThinMaterial)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Select a city")
        }
    }
}

struct SearchSheet_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheet()
    }
}
