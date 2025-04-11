//
//  ProductCardView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI
import SwiftUI

func ProductCardView() -> some View{
    
    return Rectangle()
        .frame(width: 320, height: 122, alignment: .leading)
        .cornerRadius(10.0)
        .foregroundColor(Color(UIColor(red: 0.81, green: 0.00, blue: 0.11, alpha: 1.00)))
        .overlay(
            HStack{
                Image("RedShoe")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Spacer()
                    .frame(width: 40, height: 100, alignment: .center)
                
                VStack{
                    Text("Red Shoe")
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 25, alignment: .leading)
                    
                    Text("Rs. 1199")
                        .foregroundColor(Color.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 25, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 150, height: 20, alignment: .center)
                    
                    Text("Shoe Marketplace")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 25, alignment: .leading)
                }.frame(width: 150, height: 100, alignment: .leading)
            }
        ).padding(.leading, 25)
//    return HStack{
//        Image("RedShoe")
//            .resizable()
//            .frame(width: 80, height: 80, alignment: .center)
//    }.frame(width: 277, height: 122, alignment: .center)
//    .background(Color(UIColor(red: 0.81, green: 0.00, blue: 0.11, alpha: 1.00)))
    
//    return RoundedRectangle(cornerRadius: 10, style: RoundedCornerStyle.circular)
//        .frame(width: 277, height: 122, alignment: .center)
//        .overlay(
//            Image("RedShoe")
//                .resizable()
//                .frame(width: 80, height: 80, alignment: .center)
//        )
}

struct ProductCardView_Preview: PreviewProvider{
    static var previews: some View{
        ProductCardView()
    }
}
