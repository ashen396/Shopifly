//
//  ProductNavigationView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct ProductNavigationView: View {
    
    @State private var isCalendarVisible: Bool = false
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
                    
                    
                    Text("All Products")
                        .tabItem {
                            Image(systemName: "archivebox")
                            Text("All Products")
                        }.tag(3)
                    
                    Text("Navigation")
                        .tabItem {
                            Image(systemName: "safari")
                            Text("Navigation")
                        }.tag(4)
                    
                }).onChange(of: selectedTab, perform: { value in
                    if(self.selectedTab == 2){
                        self.isCalendarVisible = true
                        self.selectedTab = 1
                    }
                })
            
            .sheet(isPresented: $isCalendarVisible, onDismiss: {
                self.isCalendarVisible = false
            }, content: {
                AddReminderView()
            })
    }
}

struct ProductNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNavigationView()
    }
}
