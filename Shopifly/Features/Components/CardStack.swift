//
//  CardStack.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import SwiftUI

struct CardStack: View {
    
    var imageList: [UIImage] = [UIImage()]
    @State private var isFirst: Bool = false
    @State private var isLast: Bool = false
    @State private var index:Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(imageList, id: \.self){
                    item in
                    
                    if(item.size.height > 10){
                        CardView(image: item)
                    }
                }
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
