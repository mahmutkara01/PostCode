//
//  PostCodeCell.swift
//  PostCode
//
//  Created by mahmut kara on 23.07.2023.
//

import SwiftUI

struct PostCodeCell: View {
    @State var country: String = "Sivas"
    @State var country_abbreviation: String = "TR"
    @State var postCode: String = "58020"
    @State var countryFlag: String = "turkey"
    @State var stateAbbreviation: String = "58"
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    
                    HStack{
                        Text(stateAbbreviation)
                            .font(.custom(FontManager.Ubuntu.regular, size: 35))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(.red.opacity(1))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Text(country)
                                .font(.custom(FontManager.Ubuntu.bold, size: 30))
                                .lineLimit(1)
                            Text(postCode)
                                .font(.custom(FontManager.Ubuntu.medium, size: 20))
                                .foregroundColor(.gray)
                                .lineLimit(1)
                            }
                        }
                }
                Spacer()
                AsyncImage(url: URL(string: "https://www.countryflags.com/wp-content/uploads/\(countryFlag)-flag-png-large.png")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .frame(width: 50, height: 50)
                        .aspectRatio(1, contentMode: .fill)
                        .padding(.trailing,10)
                } placeholder: {
                    ProgressView()
                }
            }
            
        }.padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5,x: 2,y: 2)
    }
}

struct PostCodeCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCodeCell()
    }
}
