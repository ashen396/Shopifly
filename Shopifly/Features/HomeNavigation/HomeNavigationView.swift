//
//  HomeNavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct HomeNavigationView: View {
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
                    HomescreenView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }.tag(1)
                    
                    AddItemView()
                        .tabItem {
                            Image(systemName: "plus.circle")
                            Text("Review")
                        }
                    
                    WishlistView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Wishlist")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                })
    }
}

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
    }
}
