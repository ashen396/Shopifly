//
//  CompareProductsView.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import SwiftUI

struct CompareProductsView: View {
    
    @State var product1: Product
    @State var product2: Product?
    @State var product2ID: String
    @State var selectedProduct: Product
    
    func GetSecondProduct(){
        GetProductByID(collection: "Products", fieldName: "ProductID", productID: product2ID) { (fetchedProduct) in
            product2 = fetchedProduct
        }
    }
    
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.44, green: 0.03, blue: 0.07, opacity: 1.00), Color(red: 0.84, green: 0.02, blue: 0.12, opacity: 1.00)]), startPoint: .top, endPoint: .bottom)
                .frame(width: Constants.screenWidth, height: Constants.screenWidth / 4.4, alignment: .top)
            ZStack{
                Image(uiImage: selectedProduct.image)
                    .resizable()
                    .frame(width: Constants.screenWidth / 1.5, height: Constants.screenWidth / 1.5, alignment: .top)
                
                ZStack{
                    VStack{
                        HStack{
                            Text(selectedProduct.shop)
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 100, alignment: .center)

                        }
                        
                        HStack{
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 15, height: 25, alignment: .center)
                                .foregroundColor(.white)
                                
                            Text("Back")
                                .foregroundColor(.white)
                        }.padding(.horizontal, 25)
                        .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
                    }
                }.frame(width: Constants.screenWidth, height: Constants.screenWidth, alignment: .top)
                .padding(.top, 40)
                
                
            }.frame(width: Constants.screenWidth, height: Constants.screenWidth / 1.5, alignment: .center)
            .background(Color(red: 0.81, green: 0.02, blue: 0.12, opacity: 1.00))
            .padding(.top, -10)
            
            Text(selectedProduct.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                .padding(.top, 25)
                .padding(.leading, 40)
            
            HStack{
                Text(selectedProduct.price)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor.systemGray))
            }.padding(.top, 5)
            .padding(.horizontal, 20)
            .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
                        
            CompareMultipleButton(title1: product1.title, title2: product2?.title ?? "Product2")
        }.frame(width: Constants.screenWidth, height: UIScreen.main.bounds.height, alignment: .top)
        .ignoresSafeArea()
        .onAppear {
            GetSecondProduct()
        }
    }
}
