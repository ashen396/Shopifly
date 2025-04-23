//
//  HomescreenView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import Foundation
import SwiftUI
import FirebaseStorage
import CoreData
import UserNotifications

struct HomescreenView: View{
    
    @State private var searchProduct: String = String()
    @State var firstImage: UIImage = UIImage()
    @State var imgData: Data = Data()
    @State var cardImages: [UIImage] = [UIImage()]
    @State var favCards: [Favourites] = []
    @State var productList: [Product] = []
    @State var isSearchVisible: Bool = false
    
    private func FetchData(){
        GetImageList(collection: "Promotions") { (data) in
            cardImages = data
        }
        
        GetDataList(collection: "Favourites") { (data) in
            favCards = data
        }
        
        GetProductList(collection: "Products") { (data) in
            productList = data
        }
    }
    
    var body: some View{
        VStack{
            Spacer()
                .frame(width: Constants.screenWidth, height: 25, alignment: .center)
            
            //Header
            HStack{
                HStack{
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                    
                    Text("Shopifly")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("John Doe")
                            .font(.title2)
                        
                        Text("Colombo")
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                    
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                }
            }.padding(.horizontal, 25)
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
            
            if(isSearchVisible == false){
                CustomImageTextField(title: "Search", bindState: $searchProduct, imageName: "magnifyingglass", actionOnCommit: {
                        isSearchVisible = true
                })
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    ScrollView(.vertical, showsIndicators: true){
                        CardStack(imageList: cardImages)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                        
                        //Products
                        VStack{
                            HStack{
                                Text("Nearby Favourites")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text("Show All")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                
                            }.padding(.horizontal, 25)
                            
                            Spacer()
                                .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                            
                            //Product Cards
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack{
                                    ForEach(favCards, id: \.self) { (elem: Favourites) in
                                        ProductCardView(image: elem.image, backgroundColor: elem.backgroundColor, title: elem.title, price: elem.price, storeName: elem.shop)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                        
                        Text("Recommendations")
                            .font(.title3)
                            .fontWeight(.regular)
                            .padding(.horizontal, 25)
                            .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                        
                        LazyVStack{
                            ForEach(productList, id: \.self) { (elem: Product) in
                                NavigationLink(
                                    destination: ProductNavigationView(productID: elem.productID),
                                    label: {
                                        ProductListView(image: elem.image, title: elem.title, price: elem.price, storeName: elem.shop)
                                    }).foregroundColor(.black)
                            }
                        }
                    }
                }else{
                    SearchscreenView(searchProduct: $searchProduct, isSearchVisible: $isSearchVisible)
                }
        }
        .frame(width: Constants.screenWidth, height: Constants.screenHeight - 50, alignment: .top)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .gesture(DragGesture())
        .onAppear(perform: {
            FetchData()
        })
    }
}

struct HomescreenView_Preview: PreviewProvider{
    static var previews: some View{
        HomescreenView()
    }
}
