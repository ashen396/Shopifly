//
//  CustomTextField.swift
//  Shopifly
//
//  Created by Mac on 3/29/25.
//

import Foundation
import SwiftUI


func CustomTextField(title: String, bindState: Binding<String>) -> some View{
    return TextField(title, text: bindState)
        .font(.title3)
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
        .frame(width: UIScreen.main.bounds.width - 50, height: 48)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
}
