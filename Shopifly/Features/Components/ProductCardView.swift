//
//  ProductCardView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI
import SwiftUI

func ProductCardView(image: String, backgroundColor:Color, title: String, price: String, storeName: String) -> some View{
    
    return Rectangle()
        .frame(width: 320, height: 122, alignment: .leading)
        .cornerRadius(10.0)
        .foregroundColor(backgroundColor)
        .overlay(
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Spacer()
                    .frame(width: 40, height: 100, alignment: .center)
                
                VStack{
                    Text(title)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 25, alignment: .leading)
                    
                    Text("Rs. \(price)")
                        .foregroundColor(Color.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 25, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 150, height: 20, alignment: .center)
                    
                    Text(storeName)
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 25, alignment: .leading)
                }.frame(width: 150, height: 100, alignment: .leading)
            }
        ).padding(.leading, 25)
}
