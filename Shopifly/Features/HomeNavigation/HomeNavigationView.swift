//
//  HomeNavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct HomeNavigationView: View {
    @State var index: Int = 1
    var body: some View {
        TabView(selection: $index,
                content:  {
                    HomescreenView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }.tag(1)
                    
                    AddItemView(pageIndex: $index)
                        .tabItem {
                            Image(systemName: "plus.circle")
                            Text("Review")
                        }.tag(2)
                    
                    WishlistView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Wishlist")
                        }.tag(3)
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }.tag(4)
                })
    }
}

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
    }
}
