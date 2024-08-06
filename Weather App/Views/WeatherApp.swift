//
//  WeatherApp.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct WeatherApp: View {
    
    @State var homeClicked:Bool = false
    @State var searchClicked:Bool = false
    @State var settingsClicked:Bool = false
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            ContentView()
                .onTapGesture {
                    selectedTab = "One"
                }
                .tabItem{
                    VStack{
                        Image( selectedTab == "One" ? "home-filled":"home")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .tag("One")
            
            SearchView()
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem{
                    VStack{
                        Image(selectedTab == "Two" ? "search":"search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                }
                .tag("Two")
            
            SettingsView()
                .onTapGesture {
                    selectedTab = "Three"
                }
                .tabItem{
                    VStack{
                        Image(selectedTab == "Three" ? "control-filled":"control")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                }
                .tag("Three")
            
            
        }
    }
}

struct WeatherApp_Previews: PreviewProvider {
    static var previews: some View {
            WeatherApp()
    }
}
