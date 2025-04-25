//
//  ContentView.swift
//  Shopifly
//
//  Created by yr4cobsccomp232p-044 on 3/29/25.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
    var body: some View {
        let isUserLogged = UserDefaults.standard.bool(forKey: "isUserLogged")
        if(isUserLogged == true){
            HomescreenView()
        }else{
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
