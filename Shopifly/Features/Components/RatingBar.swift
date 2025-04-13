//
//  RatingBar.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI

struct RatingBar: View {
    var body: some View {
        HStack{
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color.orange)
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(UIColor.systemGray4))
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(UIColor.systemGray4))
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(UIColor.systemGray4))
            
            Spacer()
                .frame(width: 5, height: 20, alignment: .center)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(UIColor.systemGray4))
            
        }.frame(width: 95, height: 20, alignment: .leading)
    }
}

struct RatingBar_Previews: PreviewProvider {
    static var previews: some View {
        RatingBar()
    }
}
