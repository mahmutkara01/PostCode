//
//  HomeView.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    /*
     init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemPink
        }
     */
    
    @ObservedObject var viewmodel = ViewModel()
    @State private var postCode: String = ""
    //let themes = ["Posta Kodu ile Arama", "Bölgesel Arama"]
    @State private var selectedTheme = "Posta Kodu ile Arama"

    var body: some View {
            VStack {
                VStack(spacing: 20){
                    Text("Posta Kodunun Nereye Ait Olduğunu Öğren")
                        .font(.custom(FontManager.Ubuntu.bold, size: 25))
                        .foregroundColor(.black)
                    HStack {
                        TextField(selectedTheme, text: $postCode, onCommit: {
                            viewmodel.fetchData(postCode: postCode)
                        })
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                        .tint(Color.black)
                        .foregroundColor(.black)
                        .accentColor(.black)
                        
                        Button(action: {
                            hideKeyboard()
                            viewmodel.fetchData(postCode: postCode)
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .accentColor(.purple)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .padding(.horizontal)
                }.padding(.vertical)
                
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("sari"))
                )

               /*
                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                */
                
                VStack{
                    if let locationData = viewmodel.locationData {
                        if locationData.places.isEmpty {
                            Text("Sonuç bulunamadı")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                        } else {
                            ForEach(locationData.places.prefix(1), id: \.self) { firstPlace in
                                PostCodeCell(
                                    country: firstPlace.state,
                                    postCode: postCode,
                                    stateAbbreviation: firstPlace.stateAbbreviation
                                )
                            }

                            ScrollView {
                                ForEach(locationData.places, id: \.self) { place in
                                    PostCodeDetailCell(
                                        placeName: place.placeName,
                                        state: place.state,
                                        stateAbbreviation: place.stateAbbreviation,
                                        latitude: place.latitude,
                                        longitude: place.longitude
                                    )
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
