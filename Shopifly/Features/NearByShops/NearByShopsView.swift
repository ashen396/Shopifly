//
//  NearByShopsView.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct NearByShopsView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.9721, longitude: 79.8612), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let locationMan = CLLocationManager()
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: MapInteractionModes.pan, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .ignoresSafeArea()
            .onAppear(perform: {
                locationMan.requestWhenInUseAuthorization()
            })
    }
}

struct NearByShopsView_Previews: PreviewProvider {
    static var previews: some View {
        NearByShopsView()
    }
}
