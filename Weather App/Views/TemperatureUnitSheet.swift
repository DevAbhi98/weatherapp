//
//  TemperatureUnitSheet.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI



struct TemperatureUnitSheet: View {
    
    @AppStorage("temperatureUnit") var temperatureUnit:String = "Celsius"
    @State var unitArray = ["Celsius", "Kelvin", "Fahrenheit"]
    @Environment(\.presentationMode) var presentationMode
    @State var selectedUnit:String = "Celsius"
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                Color("ColorTheme")
                    .ignoresSafeArea()
                VStack{
                    Picker("", selection: $temperatureUnit, content: {
                        ForEach(unitArray, id: \.self){ unit in
                            Text(unit)
                                .foregroundColor(Color.white)
                        }
                    })
                    .frame(height:40)
                    .padding(.top,60)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 60)
                    .pickerStyle(WheelPickerStyle())
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Set unit")
                                .font(.system(size: 20, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding()
                            Spacer()
                        }
                        .background(
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemGray))
                                .blendMode(.hardLight)
                                .opacity(1)
                        }
                        ).cornerRadius(20)
                            .foregroundStyle(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding()
                    })
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Select a unit")
        }
        
    }
}

struct TemperatureUnitSheet_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureUnitSheet()
    }
}
