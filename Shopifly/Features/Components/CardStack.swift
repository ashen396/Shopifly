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
            LazyHStack{
                CardView(cardName: "CardImage01", isFirst: true)
                CardView(cardName: "CardImage02")
                CardView(cardName: "CardImage01")
                CardView(cardName: "CardImage02")
                CardView(cardName: "CardImage01")
                CardView(cardName: "CardImage02", isLast: true)
            }.padding(.leading, 48)
            .padding(.trailing, 30)
        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: UIScreen.main.bounds.height / 4.4, maxHeight: UIScreen.main.bounds.height / 4.4, alignment: .leading)
        .padding(.leading, -15)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack()
    }
}
