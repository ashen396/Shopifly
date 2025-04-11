//
//  CardView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI
import SwiftUI

func CardView(cardName: String, isFirst: Bool = false, isLast: Bool = false) -> some View{
    return
        HStack{
            if(isFirst == true){
                Image(cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 40)
            }else if(isLast == true){
                Image(cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 40)
            }else{
                Image(cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
}
