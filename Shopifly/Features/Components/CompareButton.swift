//
//  CompareButton.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import Foundation
import SwiftUI

func CompareButton(title1: String) -> some View{
    return RoundedRectangle(cornerRadius: 35.0)
        .foregroundColor(.black)
        .frame(width: 275, height: 55, alignment: .center)
        .overlay(
            HStack{
                Text(title1)
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

func CompareMultipleButton(title1: String, title2: String, product1: Product, selectedIndex: Int, completion: @escaping (Int) -> Void)-> some View{
    return RoundedRectangle(cornerRadius: 35.0)
        .foregroundColor(.black)
        .frame(width: 275, height: 55, alignment: .center)
        .overlay(
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(selectedIndex == 1 ? .white : .black)
                    .frame(width: 125, height: 40, alignment: .center)
                    .overlay(
                        Text(title1)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(selectedIndex == 1 ? .black : .white)
                            .onTapGesture {
                                completion(1)
                            }
                    )
                
                Spacer()
//                    .frame(width: 20, height: 55, alignment: .center)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(selectedIndex == 1 ? .black : .white)
                    .frame(width: 125, height: 40, alignment: .center)
                    .overlay(
                        Text(title2)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(selectedIndex == 1 ? .white : .black)
                            .onTapGesture {
                                completion(2)
                            }
                    )
            }.padding(.horizontal, 10)
            .frame(width: 275, height: 55, alignment: .leading)
        )
}
