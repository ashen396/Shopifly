//
//  CompareProductsSearch.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import Foundation
import SwiftUI

struct CompareProductsSearchView: View{
    @Environment(\.presentationMode) var presentationMode
    @State private var search: String = ""
    @State var products: [Product] = []
    @State var chosenProduct: Product
    @State var productID: String
    
    private func SearchProducts(){
        GetProductsByKeywords(collection: "Products", searchKeyword: search) { (productList) in
            products = productList
        }
    }
    
    var body: some View{
        VStack{
        VStack{
            // Search Bar
            HStack{
                CustomImageTextField(title: "Search Product", bindState: $search, imageName: "magnifyingglass", actionOnCommit: {
                    SearchProducts()
                }, reduceWidth: CGFloat(140))
                
                Spacer()
                    .frame(width: 25, height: 48, alignment: .center)
                
                Text("Cancel")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        search.removeAll()
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            LazyVStack{
                ForEach(products, id: \.self) { (product: Product) in
                    if(!String(product.productID).elementsEqual(productID)){
                        NavigationLink(
                            destination: CompareProductsView(product1: chosenProduct, product2ID: product.productID, selectedProduct: chosenProduct),
                            label: {
                                ProductListView(image: product.image, title: product.title, price: product.price, storeName: product.shop)
                                    .foregroundColor(.black)
                            })
                    }
                }
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 120 , alignment: .top)
            
            CompareButton(title1: chosenProduct.title)
        }.padding(.top, 40)
        .frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
            .onAppear(perform: {
                SearchProducts()
            })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
