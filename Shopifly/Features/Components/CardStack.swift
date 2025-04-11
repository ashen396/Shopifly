//
//  CardStack.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI

struct CardStack: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                CardView(cardName: "CardImage01", isFirst: true)
                CardView(cardName: "CardImage02")
            }
        }.frame(width: .infinity, height: 200, alignment: .leading)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack()
    }
}
