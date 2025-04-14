//
//  CompareProductsSearch.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import Foundation
import SwiftUI

struct CompareProductsSearchView: View{
    
    @State private var search: String = "Shoes"
    
    var body: some View{
        VStack{
        VStack{
            // Search Bar
            HStack{
                TextField("Search", text: $search)
                    .font(.title3)
                    .padding(EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 15))
                    .frame(width: UIScreen.main.bounds.width - 140, height: 48)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .overlay(HStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 18, height: 18, alignment: .center)
                            .padding(.leading, 15)
                            .foregroundColor(Color(UIColor.systemGray2))
                        Spacer()
                    })
                
                Spacer()
                    .frame(width: 25, height: 48, alignment: .center)
                
                Text("Cancel")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            LazyVStack{
                ProductListView()
                ProductListView()
                ProductListView()
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 120 , alignment: .top)
            
            CompareButton()
        }.padding(.top, 40)
        .frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct CompareProductsSearchViewPreview: PreviewProvider{
    static var previews: some View{
        CompareProductsSearchView()
    }
}
