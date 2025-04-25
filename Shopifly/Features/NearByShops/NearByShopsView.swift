//
//  NearByShopsView.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI
import FirebaseFirestore
import MapKit
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct NearByShopsView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.9062952, longitude: 79.8517723), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var fetchedLocations: [Location] = []
    let locationMan = CLLocationManager()
    
    private func GetLocations(){
        Firestore.firestore().collection("Products").getDocuments { (data, error) in
                guard let documents = data?.documents else { return }
                
                for doc in documents {
                    let data = doc.data()
                    if let geopoint = data["Location"] as? GeoPoint {
                        let coordinate = CLLocationCoordinate2D(latitude: geopoint.latitude, longitude: geopoint.longitude)
                        fetchedLocations.append(Location(coordinate: coordinate))
                    }
                }
            }
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region, interactionModes: MapInteractionModes.pan, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: fetchedLocations){ location in

                    MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .ignoresSafeArea()
            .onAppear(perform: {
                locationMan.requestWhenInUseAuthorization()
            })
            .onAppear {
                GetLocations()
            }
        }
    }
}

struct NearByShopsView_Previews: PreviewProvider {
    static var previews: some View {
        NearByShopsView()
    }
}
