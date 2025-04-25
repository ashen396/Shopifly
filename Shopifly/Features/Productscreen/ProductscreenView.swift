//
//  ProductscreenView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI

struct ProductscreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var productID: String = ""
    @State private var isWishedProduct: Bool = false
    @State var product: Product = Product(productID: "", title: "", price: "", shop: "", image: UIImage())
    
    @State private var reviews: [Review] = [Review(user: User(userID: "", username: "", userImage: UIImage()), rating: 1, comment: "", commentID: "", date: "", images: [UIImage()])]
    
    @State private var rate: Int = 1
    
    func FetchProductData(){
        GetProductByID(collection: "Products", fieldName: "ProductID", productID: productID) { (data) in
            product = data
        }
    }
    
    func FetchReviews(){
        GetReviewsByProductID(collection: "Reviews", fieldName: "ProductID", productID: productID, completion: { (data) in
            reviews = data
        })
    }
    
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: product.backgroundColor != nil ? (product.backgroundColor![0] - 0.4) : 1.0, green: product.backgroundColor != nil ? (product.backgroundColor![1] - 0.4) : 1.0, blue: product.backgroundColor != nil ? (product.backgroundColor![2] - 0.4) : 1.0, opacity: 1.00), Color(red: product.backgroundColor != nil ? product.backgroundColor![0] : 1.0, green: product.backgroundColor != nil ? product.backgroundColor![1] : 1.0, blue: product.backgroundColor != nil ? product.backgroundColor![2] : 1.0, opacity: 1.00)]), startPoint: .top, endPoint: .bottom)
                .frame(width: Constants.screenWidth, height: Constants.screenWidth / 4.4, alignment: .top)
            ZStack{
                Image(uiImage: product.image)
                    .resizable()
                    .frame(width: Constants.screenWidth / 1.5, height: Constants.screenWidth / 1.5, alignment: .top)
                
                ZStack{
                    VStack{
                        HStack{
                            Text(product.shop)
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 100, alignment: .center)

                        }
                        
                        HStack{
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Group{
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .frame(width: 15, height: 25, alignment: .center)
                                        .foregroundColor(.white)
                                        
                                    Text("Back")
                                        .foregroundColor(.white)
                                }
                            })
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: ReportProductView(),
                                label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 32, height: 32, alignment: .center)
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "exclamationmark.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(.red)
                                    }
                                })
                        }.padding(.horizontal, 25)
                        .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 150, alignment: .top)
                        
                        HStack{
                            RoundedRectangle(cornerRadius: 40.0)
                                .frame(width: 60, height: 60, alignment: .center)
                                .foregroundColor(.white)
                                .shadow(color: Color.init( white: 0, opacity: 0.2), radius: 10, x: 0.0, y: 2.0)
                                .overlay(
                                    Image(systemName: isWishedProduct ? "heart.fill" : "heart")
                                        .resizable()
                                        .frame(width: 40, height: 35, alignment: .center)
                                        .foregroundColor(isWishedProduct ? Color.red : Color.black)
                                        .font(.system(size: 40, weight: Font.Weight.ultraLight))
                                )
                        }.frame(width: Constants.screenWidth, height: 75, alignment: .topTrailing)
                        .padding(.trailing, 25)
                        .onTapGesture {
                            AddToWishlist(isSelected: isWishedProduct, productID: productID, productName: product.title, userID: reviews[0].user.userID) { (updateWishlist) in
                                isWishedProduct = updateWishlist
                            }
                        }
                    }
                }.frame(width: Constants.screenWidth, height: Constants.screenWidth, alignment: .top)
                .padding(.top, 40)
                
                
            }.frame(width: Constants.screenWidth, height: Constants.screenWidth / 1.5, alignment: .center)
            .background(Color(red: product.backgroundColor != nil ? product.backgroundColor![0] : 1.0, green: product.backgroundColor != nil ? product.backgroundColor![1] : 1.0, blue: product.backgroundColor != nil ? product.backgroundColor![2] : 1.0, opacity: 1.00))
            .padding(.top, -10)
            
            Text(product.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                .padding(.top, 25)
                .padding(.leading, 40)
            
            HStack{
                Text("Rs. \(product.price)")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor.systemGray))
                    Spacer()
            
                HStack{
                    NavigationLink(destination: CompareProductsSearchView(chosenProduct: product, productID: productID), label: {
                        Text("Compare")
                            .foregroundColor(.blue)
                    })
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 20, alignment: .center)
                        .font(.system(size: 40, weight: Font.Weight.light))
                        .foregroundColor(.blue)
                }
            }.padding(.top, 5)
            .padding(.horizontal, 20)
            .frame(width: Constants.screenWidth, height: 40, alignment: .leading)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            // Ratings
            ScrollView{
                if(reviews.count > 0){
                    VStack{
                        ForEach(reviews, id: \.self) { review in
                            if(review.comment != nil){
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
                    }
                }else{
                    Text("No Reviews Available!")
                }
            }.frame(width: Constants.screenWidth, height: 270, alignment: .topLeading)
            
            NavigationButton(title: "Write a Review", foregroundColor: .white, backgroundColor: .blue, destination: WriteReviewView(productID: productID))
        }.frame(width: Constants.screenWidth, height: UIScreen.main.bounds.height, alignment: .top)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture())
        .onAppear(perform: {
            FetchProductData()
            FetchReviews()
            GetUserWishlist(productID: productID, userID: UserDefaults.standard.string(forKey: "UserID") ?? "") { (isWishedItem) in
                isWishedProduct = isWishedItem
            }
        })
    }
}

struct ProductscreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProductscreenView()
    }
}
