//
//  MapView.swift
//  PostCode
//
//  Created by mahmut kara on 24.07.2023.
//

import SwiftUI

struct MapView: View {
    @State var latitude: String = "39.8747"
    @State var longitude: String = "35.5219"
    var body: some View {
        VStack(spacing: 20) {
            Text("Enlem:   \(latitude)")
            Text("Boylam:  \(longitude)")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
