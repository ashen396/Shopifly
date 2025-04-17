//
//  AllProductsView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI

struct AllProductsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Group{
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.gray)
                    })
                    
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 50, alignment: .trailing)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                
                HStack{
                    Text("SHOE MARKETPLACE")
                        .font(.title)
                        .fontWeight(.bold)
                }.frame(width: Constants.screenWidth, height: 20, alignment: .top)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
            }
            
            Group{
                Text("Product List")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            }
            ScrollView(.vertical, showsIndicators: true, content: {
                Group{
                    ProductListView()
                    ProductListView()
                    ProductListView()
                    ProductListView()
                    ProductListView()
                    ProductListView()
                }
            })
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct AllProductsView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsView()
    }
}
