//
//  ProductNavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct ProductNavigationView: View {
    
    @State private var isCalendarVisible: Bool = true
    
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
                    ProductscreenView()
                        .tabItem {
                            Image(systemName: "bag")
                            Text("Product")
                        }.tag(1)
                
                    Text("Add to calendar")
                        .sheet(isPresented: $isCalendarVisible, onDismiss: {
                            isCalendarVisible = false
                        }, content: {
                            HomescreenView()
                        })
                        .tabItem {
                            Image(systemName: "calendar.badge.plus")
                            Text("Reminder")
                        }.tag(2)
                    
                    Text("All Products")
                        .tabItem {
                            Image(systemName: "archivebox")
                            Text("All Products")
                        }.tag(3)
                    
                    Text("Navigation")
                        .tabItem {
                            Image(systemName: "safari")
                            Text("Navigation")
                        }
        })
    }
}

struct ProductNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNavigationView()
    }
}
