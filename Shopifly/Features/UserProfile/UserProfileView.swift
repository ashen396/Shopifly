//
//  UserProfileView.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI
import FirebaseFirestore

struct UserReview: Hashable {
    var storeName: String
    var storeImage: UIImage
    var rating: Int
    var comment: String
}

struct UserProfileView: View {
    
    @State var userID: String = ""
    @State var userImage: UIImage = UIImage()
    @State var productsList: [Product]?
    @State private var userReviews: [UserReview] = []
    
    private func GetReviewsByUserID(){
        Firestore.firestore().collection("Reviews").whereField("UserID", isEqualTo: userID).getDocuments { (docs, error) in
            
            docs?.documents.forEach({ (document) in
                let docData = document.data()
                
                GetProductByID(collection: "Products", fieldName: "ProductID", productID: String(describing: docData["ProductID"]!)) { (fetchedProduct) in
                    var userReview = UserReview(storeName: "", storeImage: UIImage(), rating: 1, comment: "")
                    userReview.storeName = fetchedProduct.shop
                    userReview.storeImage = fetchedProduct.image
                    userReview.rating = Int(String(describing: docData["Rating"]!))!
                    userReview.comment =  String(describing: docData["Comment"]!)
                    
                    userReviews.append(userReview)
                }
            })
        }
    }
    
    private func ReportUser(){
        let data = ["UserID": userID, "ReportedByID": UserDefaults.standard.string(forKey: "UserID"), "Date": String(describing: Date())]
        Firestore.firestore().collection("UserReports").addDocument(data: data as [String : Any]) { (error) in
            if(error != nil){
                print(error as Any)
                return
            }
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: userImage)
                    .resizable()
                    .frame(width: Constants.screenWidth / 2, height:  Constants.screenWidth / 2, alignment: .center)
            }.frame(width: Constants.screenWidth, height: Constants.screenWidth / 2, alignment: .center)
            .padding(.top, 100)
            
            Text("@\(userID)")
                .foregroundColor(Color.gray)
            
            HStack{
                if(userID != UserDefaults.standard.string(forKey: "UserID")){
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 125, height: 40, alignment: .center)
                    .foregroundColor(.red)
                    .overlay(
                        Text("Report")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    ).onTapGesture {
                        ReportUser()
                    }
                }
            }.padding(.top, 10)
            .frame(width: Constants.screenWidth, height: 75, alignment: .center)
            
            HStack{
                Text("Reviews")
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            
            ScrollView(showsIndicators: true){
                VStack{
                    ForEach(userReviews, id: \.self) { (review: UserReview) in
                        VStack{
                            HStack{
                                Image(uiImage: review.storeImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100, alignment: .leading)
                                
                                VStack{
                                    Text(review.storeName)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .frame(width: 250, height: 20, alignment: .leading)
                                    
                                    Spacer()
                                        .frame(width: 250, height: 5, alignment: .center)
                                    
                                    RatingBar(rateCount: review.rating, isClickable: false)
                                        .frame(width: 250, height: 20, alignment: .leading)
                                    
                                    Text(review.comment)
                                        .font(.body)
                                        .fontWeight(.light)
                                        .frame(width: 250, height: 20, alignment: .leading)
                                }
                            }.padding(.horizontal, 25)
                            .frame(width: Constants.screenWidth, height: 120, alignment: .leading)
                            
                            Rectangle()
                                .padding(.horizontal, 25)
                                .frame(width: Constants.screenWidth, height: 1, alignment: .center)
                                .foregroundColor(Color(UIColor.systemGray3))
                        }
                    }
                }
            }
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .topLeading)
        .onAppear {
            GetReviewsByUserID()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
