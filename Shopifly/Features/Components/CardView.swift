//
//  CardView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI
import SwiftUI

func CardView(cardName: String, isFirst: Bool = false) -> some View{
    return
//        HStack{
//            Image(cardName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .padding(.leading, 40)
//    //        .frame(width: 341, height: .infinity, alignment: .center)
//
////            Spacer()
////                .frame(width: 20, height: 100, alignment: .trailing)
//        }
    
        HStack{
            if(isFirst == true){
                Image(cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 40)
            }else{
                Image(cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 40)
            }
        }
}
