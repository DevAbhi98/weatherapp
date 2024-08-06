//
//  SettingsView.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("currentCity") var currentCity:String = "Ahmedabad"
    @AppStorage("distanceUnit") var theDistanceUnit: String = "km"
    @AppStorage("temperatureUnit") var temperatureUnit:String = "Celsius"
    @AppStorage("windUnit") var theWindUnit:String = "km/h"
    @State var showingSetCity:Bool = false
    @State var showingTempUnit:Bool = false
    @State var windUnit:Bool = false
    @State var distanceUnit:Bool = false
    
    
    init() {
        
        UITableView.appearance().backgroundColor = .clear
        
        //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white ]

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color("ColorTheme")
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Text("Weather Settings").foregroundColor(Color.white)
                        Spacer()
                    }.padding(.top)
                        .padding(.top)
                        .padding(.leading)
                    
                    VStack(alignment:.leading, spacing: 0){

                        HStack{
                            Image("smart-city")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                            Text("City")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text(currentCity)
                                .foregroundColor(Color.gray)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .onTapGesture {
                            showingSetCity.toggle()
                        }
                        .sheet(isPresented: $showingSetCity, content: {
                            SearchSheet()
                        })
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.trailing, 10)

                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image("thermometer")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                            Text("Temperature Unit")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text(temperatureUnit)
                                .foregroundColor(Color.gray)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .onTapGesture {
                            showingTempUnit.toggle()
                        }
                        .sheet(isPresented: $showingTempUnit, content: {
                            TemperatureUnitSheet()
                        })
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
         
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image("wind")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                            
                            Text("Wind speed Unit")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text(theWindUnit)
                                .foregroundColor(Color.gray)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .onTapGesture {
                            windUnit.toggle()
                        }
                        .sheet(isPresented: $windUnit, content: {
                            WindUnitSheet()
                        })
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                           
                            Image("distance")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                            
                            Text("Distance Unit")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("\(theDistanceUnit)")
                                .foregroundColor(Color.gray)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .onTapGesture {
                            distanceUnit.toggle()
                        }
                        .sheet(isPresented: $distanceUnit, content: {
                            DistanceUnitSheet()
                        })
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom,5)
                     
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
                    
                    HStack{
                        Text("About the application").foregroundColor(Color.white)
                        Spacer()
                    }.padding(.top)
                        .padding(.top)
                        .padding(.leading)
                    
                    VStack(alignment:.leading, spacing: 0){

                        HStack{
                            
                            Image(systemName: "gear")
                                .foregroundColor(Color.gray)
                            
                            Text("Application")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("Weather App")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.trailing, 10)

                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "checkmark.seal")
                                .foregroundColor(Color.gray)
                            
                            Text("Compatibility")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("iPhone")
                                .foregroundColor(Color.gray)

                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
         
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "keyboard")
                                .foregroundColor(Color.gray)
                            
                            Text("Developer")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("Abhishek Joshi")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "paintbrush")
                                .foregroundColor(Color.gray)
                            
                            Text("Designer")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("Abhishek Joshi")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "flag")
                                .foregroundColor(Color.gray)
                            
                            Text("Version")
                                .foregroundColor(Color.white)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("1.0.0")
                                .foregroundColor(Color.gray)
                            
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom,5)
                        
                     
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
                    
                    Spacer()
                    
                }
                
            }
            
            .navigationBarTitle("Settings", displayMode: .inline)

        }
    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct FormItem: View {
    
    var title:String
    var endText:String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            
            HStack{
                Text("Weather Settings").foregroundColor(Color.white)
                Spacer()
            }.padding(.top)
                .padding(.top)
                .padding(.leading)
            VStack{
                HStack{
                    Text("Hello")
                        .foregroundColor(Color.white)
                    Spacer()
                }
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
            .padding()
            .cornerRadius(20)
            .foregroundStyle(.ultraThinMaterial)
            Spacer()
            
        }
    }
}
