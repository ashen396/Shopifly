//
//  ProductListView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

func ProductListView() -> some View{
    return VStack{
        HStack{
            Image("BlueTShirt")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .leading)
            
            VStack{
                Text("Blue Shirt")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 5, alignment: .center)
                
                Text("Rs. 1199")
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 15, alignment: .center)
                
                Text("T-Shirt Marketplace")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 250, height: 20, alignment: .leading)
            }
        }.padding(.horizontal, 25)
        .frame(width: Constants.screenWidth, height: 120, alignment: .leading)
        
        Rectangle()
            .padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 1, alignment: .center)
            .foregroundColor(Color(UIColor.systemGray3))
    }
}

struct ProductListView_Preview: PreviewProvider{
    static var previews: some View{
        ProductListView()
    }
}
