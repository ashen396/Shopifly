//
//  HomescreenView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import Foundation
import SwiftUI

struct HomescreenView: View{
    
    @State private var search = ""
    
    var body: some View{
        VStack{
            Spacer()
                .frame(width: Constants.screenWidth, height: 25, alignment: .center)
            
            //Header
            HStack{
                HStack{
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                    
                    Text("Shopifly")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("John Doe")
                            .font(.title2)
                        
                        Text("Colombo")
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                    
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                }
            }.padding(.horizontal, 25)
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
    
            CustomTextField(title: "Search", bindState: $search)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                CardStack()
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                
                //Products
                VStack{
                    HStack{
                        Text("Nearby Favourites")
                            .font(.title3)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text("Show All")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                    }.padding(.horizontal, 25)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    //Product Cards
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ProductCardView(image: "RedShoe", backgroundColor: Constants.productBackgroundColor, title: "Red Shoe", price: "1199", storeName:"Shoe Marketplace")
                            ProductCardView(image: "GreenShoe", backgroundColor: Constants.productBackgroundColor2, title: "Green Shoe", price: "1199", storeName:"Shoe Marketplace")
                        }
                    }
                }
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                Text("Recommendations")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                
                LazyVStack{
                    ProductListView()
                    ProductListView()
                    ProductListView()
                    ProductListView()
                }
            }
        }
    }
}

struct HomescreenView_Preview: PreviewProvider{
    static var previews: some View{
        HomescreenView()
    }
}
