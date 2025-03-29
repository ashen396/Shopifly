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
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        .frame(width: 314, height: 40)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 10)
}
