//
//  HomeView.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    /* init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemPink
        } */
    
    @ObservedObject var viewmodel = ViewModel()
    @State private var postCode: String = ""
    let themes = ["Posta Kodu ile Arama", "Bölgesel Arama"]
    @State private var selectedTheme = "Posta Kodu ile Arama"

    var body: some View {
            VStack {
                ZStack(alignment: .trailing) {
                    TextField(selectedTheme, text: $postCode, onCommit: {
                        viewmodel.fetchData(postCode: postCode)
                    })
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.1))
                    )
                    .font(.system(size: 20, weight: .bold))
                    .tint(Color.purple)
                    .foregroundColor(.black)
                    .accentColor(.purple)
                    Button(action: {
                        viewmodel.fetchData(postCode: postCode)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.3)))
                            .accentColor(.purple)
                    }
                    .padding(.trailing, 8)
                }

                Picker("Appearance", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
                VStack{
                        if let locationData = viewmodel.locationData {
                            if let firstPlace = locationData.places.first {
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
