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
                            Text(placeName)
                                .font(.custom(FontManager.Ubuntu.bold, size: 22))
                        }
                    }
                    Spacer()
                    Image(systemName: "map")
                        .font(.custom(FontManager.Ubuntu.light, size: 20))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.yellow)
                        .cornerRadius(10)
                        .shadow(radius: 1,x: 1,y: 1)
                        .onTapGesture {
                            isMapViewPresented.toggle()
                        }
                }
            }
            .sheet(isPresented: $isMapViewPresented) {
                MapView(latitude: latitude, longitude: longitude)
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
