//
//  RatingBar.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI

struct RatingBar: View {
    @State var rateCount: Int = 1
    @State var isClickable: Bool = false
    
    var body: some View {
        HStack{
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color.orange)
                .onTapGesture(perform: {
                    if(isClickable == true){
                        rateCount = 1
                    }
                })
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(rateCount >= 2 ? Color.orange : Color(UIColor.systemGray4))
                .onTapGesture(perform: {
                    if(isClickable == true){
                        rateCount = 2
                    }
                })
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(rateCount >= 3 ? Color.orange : Color(UIColor.systemGray4))
                .onTapGesture(perform: {
                    if(isClickable == true){
                        rateCount = 3
                    }
                })
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(rateCount >= 4 ? Color.orange : Color(UIColor.systemGray4))
                .onTapGesture(perform: {
                    if(isClickable){
                        rateCount = 4
                    }
                })
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(rateCount >= 5 ? Color.orange : Color(UIColor.systemGray4))
                .onTapGesture(perform: {
                    if(isClickable == true){
                        rateCount = 5
                    }
                })
            
        }.frame(width: 95, height: 20, alignment: .leading)
    }
}
