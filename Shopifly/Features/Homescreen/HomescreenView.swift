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
            //Header
            HStack{
                HStack{
                    Text("Shopifly")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(width: 60, height: 20, alignment: .leading)
                }
                
                HStack{
                    VStack{
                        Text("John Doe")
                            .font(.title)
                        
                        Text("Colombo")
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                }
            }.padding(.horizontal, 40)
            .frame(width: 425, height: 100, alignment: .center)
    
            CustomTextField(title: "Search", bindState: $search)
            
            ScrollView(.vertical, showsIndicators: true){
                CardStack()
                
                Spacer()
                    .frame(width: 160, height: 25, alignment: .center)
                
                //Products
                VStack{
                    HStack{
                        Text("Nearby Favourites")
                        
                        Spacer()
                            .frame(width: 160, height: 50, alignment: .center)
                        
                        Text("Show All")
                            .font(.callout)
                            .foregroundColor(.blue)
                    }
                    
                    //Product Cards
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ProductCardView()
                            ProductCardView()
                        }
                    }
                }
                
                Spacer()
                    .frame(width: 160, height: 50, alignment: .center)
                
                VStack{
                    HStack{
                        Text("Recommendations")
                    }.frame(width: 380, height: .infinity, alignment: .leading)
                    
                    VStack{
                        ProductCardView()
                        ProductCardView()
                    }
                    
                }.frame(width: 380, height: .infinity, alignment: .leading)
                
            }
        }
    }
}

struct HomescreenView_Preview: PreviewProvider{
    static var previews: some View{
        HomescreenView()
    }
}
