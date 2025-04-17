//
//  NavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/17/25.
//

import SwiftUI
import MapKit

struct MapNavigationView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.9721, longitude: 79.8612), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct MapNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MapNavigationView()
    }
}
