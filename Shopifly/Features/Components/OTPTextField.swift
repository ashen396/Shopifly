//
//  OTPTextField.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import Foundation
import SwiftUI

func OTPTextField(title: String, bindState: Binding<String>, isLast: Bool = false) -> some View{
    return
        HStack{
            TextField(title, text: bindState)
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            .frame(width: 40, height: 40)
            .font(.body)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .padding(.bottom, 10)
        
            isLast == false ?
                Spacer()
                    .frame(width: 20, height: 0, alignment: .trailing) : nil
        }
}
