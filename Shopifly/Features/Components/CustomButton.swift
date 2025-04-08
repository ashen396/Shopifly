//
//  CustomButton.swift
//  Shopifly
//
//  Created by Mac on 3/29/25.
//

import Foundation
import SwiftUI

func CustomButton(title: String, foregroundColor: Color, backgroundColor: Color, stroke: Bool? = false, padding: CGFloat = 10.0, function: (() -> Void)? = nil) -> some View{
    return Button(title)
    {
        function?()
    }.frame(minWidth: 0, idealWidth: 314, maxWidth: 314, minHeight: 0, idealHeight: 44, maxHeight: 44, alignment: .center)
    .font(.system(size: 18, weight: .bold))
    .foregroundColor(foregroundColor)
    .background(backgroundColor)
    .cornerRadius(10)
    .overlay(stroke == true ? RoundedRectangle(cornerRadius: 10)
        .stroke(Color.black) : nil)
    .padding(.top, padding)
}
