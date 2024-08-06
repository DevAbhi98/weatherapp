//
//  WindUnitSheet.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct WindUnitSheet: View {
    
    @State var unitArray = ["km/h", "miles/h"]
    @AppStorage("windUnit") var windUnit:String = "km/h"
    @State var selectedUnit:String = "km/h"
    @Environment(\.presentationMode) var presentationMode
    
    
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
                    Picker("", selection: $windUnit, content: {
                        ForEach(unitArray, id: \.self){ unit in
                            Text(unit)
                                .foregroundColor(Color.white)
                        }
                    })
                    .frame(height:40)
                    .padding(.top,40)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 40)
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

struct WindUnitSheet_Previews: PreviewProvider {
    static var previews: some View {
        WindUnitSheet()
    }
}
