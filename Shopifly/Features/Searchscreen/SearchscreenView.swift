//
//  SearchscreenView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

struct SearchscreenView: View {
    
    @Binding var searchProduct: String
    @Binding var isSearchVisible: Bool
    @State var products: [Product] = []
    
    private func SearchProducts(){
        GetProductsByKeywords(collection: "Products", searchKeyword: searchProduct) { (productList) in
            products = productList
        }
    }
    
    var body: some View {
        VStack{
            
            //Search Bar
            HStack{
                CustomImageTextField(title: searchProduct, bindState: $searchProduct, imageName: "magnifyingglass", actionOnCommit: {
                    SearchProducts()
                }, reduceWidth: CGFloat(140))
                
                Spacer()
                    .frame(width: 25, height: 48, alignment: .center)
                
                Text("Cancel")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        isSearchVisible = false
                        searchProduct.removeAll()
                    }
            }
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                HStack{
                    Text("Items (\(products.count))")
                }.font(.title3)
                .foregroundColor(Color(UIColor.systemGray))
                .padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                
                LazyVStack{
                    ForEach(products, id: \.self) { (product: Product) in
                        NavigationLink(
                            destination: ProductscreenView(productID: product.productID),
                            label: {
                                ProductListView(image: product.image, title: product.title, price: product.price, storeName: product.shop)
                                    .foregroundColor(.black)
                            })
                    }
                }
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                
                HStack{
                    Text("Shops (0)")
                }.font(.title3)
                .foregroundColor(Color(UIColor.systemGray))
                .padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
        .onAppear(perform: {
            SearchProducts()
        })
    }
}
