//
//  ProductNavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct ProductNavigationView: View {
    
    @State private var isSheetVisible: Bool = false
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
                    ProductscreenView()
                        .tabItem {
                            Image(systemName: "bag")
                            Text("Product")
                        }.tag(1)
                
                    ProductscreenView()
                        .tabItem {
                            Image(systemName: "calendar.badge.plus")
                            Text("Reminder")
                        }.tag(2)
                    
                    
                    ProductscreenView()
                        .tabItem {
                            Image(systemName: "archivebox")
                            Text("All Products")
                        }.tag(3)
                    
                    MapNavigationView()
                        .tabItem {
                            Image(systemName: "safari")
                            Text("Navigation")
                        }.tag(4)
                    
                }).onChange(of: selectedTab, perform: { value in
                    if(self.selectedTab == 2 || self.selectedTab == 3){
                        self.isSheetVisible = true
                    }
                })
            
            .sheet(isPresented: $isSheetVisible, onDismiss: {
                selectedTab = 1
                self.isSheetVisible = false
            }, content: {
                if(selectedTab == 2){
                    AddReminderView()
                }
                
                if(selectedTab == 3){
                    AllProductsView()
                }
            })
    }
}

struct ProductNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNavigationView()
    }
}
