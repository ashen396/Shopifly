//
//  CompareProductsView.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import SwiftUI

struct CompareProductsView: View {
    
    @State var product1: Product
    @State var product2Title: String
    @State var product2: Product?
    @State var product2ID: String
    @State var selectedProduct: Product
    @State private var isSelectorVisible: Bool = false
    @State private var selIndex: Int = 1
    @State private var prod1Reviews: [Review] = [Review(user: User(userID: "", username: "", userImage: UIImage()), rating: 1, comment: "", commentID: "", date: "", images: [UIImage()])]
    @State private var prod2Reviews: [Review] = [Review(user: User(userID: "", username: "", userImage: UIImage()), rating: 1, comment: "", commentID: "", date: "", images: [UIImage()])]
    @State private var selectedReviews: [Review] = [Review(user: User(userID: "", username: "", userImage: UIImage()), rating: 1, comment: "", commentID: "", date: "", images: [UIImage()])]
    
    func GetSecondProduct(){
        GetProductByID(collection: "Products", fieldName: "ProductID", productID: product2ID) { (fetchedProduct) in
            if(fetchedProduct != nil){
                product2 = fetchedProduct
                FetchReviews()
                isSelectorVisible = true
            }
        }
    }
    
    func FetchReviews(){
        // Product1 Reviews
        GetReviewsByProductID(collection: "Reviews", fieldName: "ProductID", productID: product1.productID, completion: { (data) in
            prod1Reviews = data
            selectedReviews = prod1Reviews
        })
        
        //Product2 Reviews
        GetReviewsByProductID(collection: "Reviews", fieldName: "ProductID", productID: product2!.productID, completion: { (data) in
            prod2Reviews = data
        })
    }
    
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: selectedProduct.backgroundColor != nil ? (selectedProduct.backgroundColor![0] - 0.4) : 1.0, green: selectedProduct.backgroundColor != nil ? (selectedProduct.backgroundColor![1] - 0.4) : 1.0, blue: selectedProduct.backgroundColor != nil ? (selectedProduct.backgroundColor![2] - 0.4) : 1.0, opacity: 1.00), Color(red: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![0] : 1.0, green: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![1] : 1.0, blue: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![2] : 1.0, opacity: 1.00)]), startPoint: .top, endPoint: .bottom)
                .frame(width: Constants.screenWidth, height: Constants.screenWidth / 4.4, alignment: .top)
            ZStack{
                Image(uiImage: selectedProduct.image)
                    .resizable()
                    .frame(width: Constants.screenWidth / 1.5, height: Constants.screenWidth / 1.5, alignment: .top)
                
                ZStack{
                    VStack{
                        HStack{
                            Text(selectedProduct.shop)
                                .font(.title2)
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
            .background(Color(red: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![0] : 1.0, green: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![1] : 1.0, blue: selectedProduct.backgroundColor != nil ? selectedProduct.backgroundColor![2] : 1.0, opacity: 1.00))
            .padding(.top, -10)
            
            Text(selectedProduct.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                .padding(.top, 25)
                .padding(.leading, 40)
            
            HStack{
                Text("Rs. \(selectedProduct.price)")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor.systemGray))
            }.padding(.top, 5)
            .padding(.horizontal, 20)
            .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            // Ratings
            ScrollView{
                VStack{
                    
                    ForEach(selectedReviews, id: \.self) { review in
                        VStack{
                            HStack{
                                NavigationLink(
                                    destination: UserProfileView(userID: review.user.userID, userImage: review.user.userImage),
                                    label: {
                                        Image(uiImage: review.user.userImage)
                                            .resizable()
                                            .frame(width: 60, height: 60, alignment: .topLeading)
                                    })
                                
                                VStack{
                                    
                                    // Username
                                    HStack{
                                        Text(review.user.username)
                                            .foregroundColor(Color.gray)
                                        
                                        RatingBar(rateCount: review.rating, isClickable: false)
                                        
                                        Spacer()
                                        
                                        Text(review.date)
                                            .font(.callout)
                                            .fontWeight(.light)
                                            .foregroundColor(Color.gray)
                                            .padding(.trailing, 25)
                                    }.frame(width: Constants.screenWidth - 85, height: 20, alignment: .leading)
                                    
                                    // Comment
                                    VStack{
                                        Text(review.comment)
                                            .padding(.leading, 5)
                                            .padding(.trailing, 50)
                                            .frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    
                                }.frame(width: Constants.screenWidth - 85, height: 50, alignment: .topLeading)
                                
                            }
                            
                            Spacer()
                                .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                            
                            HStack{
                                ForEach(review.images, id: \.self){ fetchedImage in
                                    Image(uiImage: fetchedImage)
                                }
                            }.padding(.leading, 40)
                            .frame(width: Constants.screenWidth - 85, height: 48, alignment: .leading)
                            
                        }.padding(.horizontal, 15)
                        .frame(width: Constants.screenWidth, height: review.images.count > 1 ? 175 : 100, alignment: .topLeading)
                    }
                }
            }.frame(width: Constants.screenWidth, height: 270, alignment: .topLeading)
                        
            if(isSelectorVisible == true){
                CompareMultipleButton(title1: product1.title, title2: product2Title, product1: product1, selectedIndex: selIndex) { (selectedIndex) in
                    selIndex = selectedIndex
                    if(selectedIndex == 1){
                        selectedProduct = product1
                        selectedReviews = prod1Reviews
                    }else{
                        selectedProduct = product2!
                        selectedReviews = prod2Reviews
                    }
                }
            }
        }.frame(width: Constants.screenWidth, height: UIScreen.main.bounds.height, alignment: .top)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            GetSecondProduct()
        }
    }
}
