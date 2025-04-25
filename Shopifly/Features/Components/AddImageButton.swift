//
//  AddImageButton.swift
//  Shopifly
//
//  Created by Mac on 4/25/25.
//

import Foundation
import SwiftUI

struct AddImageButton: View {
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 50, height: 50, alignment: .center)
            .foregroundColor(Color(UIColor.systemGray6))
            .overlay(
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            )
    }
}

struct AddImageButton_Preview: PreviewProvider{
    static var previews: some View{
        AddImageButton()
    }
}
