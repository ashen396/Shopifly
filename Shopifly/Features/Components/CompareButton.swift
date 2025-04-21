//
//  CompareButton.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import Foundation
import SwiftUI

func CompareButton() -> some View{
    return RoundedRectangle(cornerRadius: 35.0)
        .foregroundColor(.black)
        .frame(width: 275, height: 55, alignment: .center)
        .overlay(
            HStack{
                Text("Red Shoe")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                
                Spacer()
//                    .frame(width: 20, height: 55, alignment: .center)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: 125, height: 40, alignment: .center)
                    .overlay(
                        Text("Search")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    )
            }.padding(.horizontal, 10)
            .frame(width: 275, height: 55, alignment: .leading)
        )
}
