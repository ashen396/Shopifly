//
//  WishlistVIew.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        VStack{
            // Header
            HStack{
                Text("Wish List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("Remove All")
                    .foregroundColor(Color.red)
            }.padding(.horizontal, 25)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                LazyVStack{
                    ProductListView()
                    ProductListView()
                    ProductListView()
                }
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 120, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .gesture(DragGesture())
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
