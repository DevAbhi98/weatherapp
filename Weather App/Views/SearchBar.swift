//
//  SearchBar.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct SearchBar: View {
    
    @State var searchedText:String
    @AppStorage("searchItem") var searchItem:String = ""
    @AppStorage("searchedClick") var searchedItem:Bool = false
    
    var body: some View {
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
                
        }
 
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    @State static var someext:String = ""
    
    static var previews: some View {
        SearchBar(searchedText: someext)
            .background(Color("ColorTheme"))
    }
}
