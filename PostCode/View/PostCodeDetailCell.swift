//
//  PostCodeDetailCell.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import SwiftUI

struct PostCodeDetailCell: View {
    @State var placeName: String = "Dört Eylül Köyü"
    @State var state: String = "Kahramanmaraş"
    @State var stateAbbreviation: String = "58"
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State private var isMapViewPresented = false
    
    var body: some View {
        VStack{
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            if placeName.isEmpty {
                                Text(state)
                                    .font(.custom(FontManager.Ubuntu.bold, size: 22))
                            } else {
                                Text(placeName)
                                    .font(.custom(FontManager.Ubuntu.bold, size: 22))
                            }
                        }
                    }
                    Spacer()
                    Button {
                        isMapViewPresented.toggle()
                    } label: {
                        Image(systemName: "map")
                            .font(.custom(FontManager.Ubuntu.light, size: 20))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(.yellow)
                            .cornerRadius(10)
                            .shadow(radius: 1,x: 1,y: 1)
                    }

                }
            }
            .sheet(isPresented: $isMapViewPresented) {
                VStack(alignment: .trailing, spacing: 10){
                    HStack{
                        Text("Harita")
                            .font(.custom(FontManager.Ubuntu.bold, size: 30))
                        Spacer()
                        Button{
                            isMapViewPresented = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.custom(FontManager.Ubuntu.bold, size: 20))
                                .foregroundColor(.white)
                                .padding(5)
                                .background(.yellow)
                                .cornerRadius(10)
                                .shadow(radius: 1,x: 1,y: 1)
                        }
                    }.padding(.horizontal,10)
                    
                    ZStack {
                        MapView(latitude: latitude, longitude: longitude)
                            .cornerRadius(25)
                        VStack{
                            Spacer()
                            if placeName.isEmpty {
                                Text(state)
                                    .font(.custom(FontManager.Ubuntu.bold, size: 20))
                                    .padding(10)
                                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                            } else {
                                Text(placeName)
                                    .font(.custom(FontManager.Ubuntu.bold, size: 20))
                                    .padding(10)
                                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                            }
                        }.padding(.bottom)
                    }
                }.padding()
            }
            .padding(.vertical,15)
            .padding(.horizontal,15)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 3,x: 2,y: 2)

        }.padding(.bottom,5)
            .padding(.top,2)
            .padding(.horizontal,5)
    }
}

struct PostCodeDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCodeDetailCell()
    }
}
