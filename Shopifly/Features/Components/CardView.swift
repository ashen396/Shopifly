//
//  CardView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI

func CardView(image: UIImage, isFirst: Bool = false, isLast: Bool = false) -> some View{
    return
        HStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
}
