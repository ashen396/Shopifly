//
//  CustomImageTextField.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import Foundation
import SwiftUI


func CustomImageTextField(title: String, bindState: Binding<String>, imageName: String) -> some View{
    return TextField(title, text: bindState)
        .font(.title3)
        .padding(EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 15))
        .frame(width: UIScreen.main.bounds.width - 50, height: 48)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .overlay(HStack{
            Image(systemName: imageName)
                .resizable()
                .frame(width: 18, height: 18, alignment: .center)
                .padding(.leading, 15)
                .foregroundColor(Color(UIColor.systemGray2))
            Spacer()
        })
}
