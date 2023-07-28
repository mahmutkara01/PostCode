//
//  MapView.swift
//  PostCode
//
//  Created by mahmut kara on 24.07.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion
      
      init(latitude: String, longitude: String) {
          let lat = Double(latitude) ?? 0.0
          let long = Double(longitude) ?? 0.0
          
          _region = State(initialValue: MKCoordinateRegion(
              center: CLLocationCoordinate2D(latitude: lat, longitude: long),
              span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
          ))
      }
      
      var body: some View {
          VStack(spacing: 20) {
              Map(coordinateRegion: $region)
          }
          .navigationTitle("Harita")
      }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: "39.7499385", longitude: "37.0141287")
    }
}
