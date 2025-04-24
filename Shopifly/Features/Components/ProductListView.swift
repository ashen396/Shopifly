//
//  ProductListView.swift
//  Shopifly
//
//  Created by Mac on 4/12/25.
//

import SwiftUI
import FirebaseFirestore

struct Product: Hashable{
    var productID: String
    var title: String
    var price: String
    var shop: String
    var image: UIImage
    var backgroundColor: Array<Double>?
}

func GetProductList(collection: String, completion: @escaping ([Product]) -> Void){
    var dataArray: [Product] = []
    
    Firestore.firestore().collection(collection).getDocuments { (data, error) in
        data?.documents.forEach({ (doc) in
            
            let data = doc.data()
            let prodID = String(describing: data["ProductID"]!)
            let title = String(describing: data["Name"]!)
            let price = String(describing: data["Price"]!)
            let shop = String(describing: data["Shop"]!)
            let imageName = String(describing: data["Image"]!)
            GetImage(imageName: imageName) { (image) in
                
                let obj = Product(productID: prodID, title: title, price: price, shop: shop, image: image)
                dataArray.append(obj)
                completion(dataArray)
            }
        })
    }
}

func RemoveFromWishlist(collection: String, userID: String, productID: String){
    Firestore.firestore().collection(collection).whereField("UserID", isEqualTo: userID).whereField("ProductID", isEqualTo: productID)
        .limit(to: 1).getDocuments { (docs, error) in
            let documents = docs?.documents
            
            documents?.forEach({ (doc) in
                Firestore.firestore().collection(collection).document(doc.documentID).delete { (error) in
                    if(error != nil){
                        print("WishList Error: \(error)")
                    }else{
                        print("Removed from wishlist!")
                    }
                }
            })
        }
}

func ProductListView(image: UIImage? = UIImage(), title: String? = "", price: String? = "", storeName: String? = "") -> some View{
    return VStack{
        HStack{
            Image(uiImage: image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .leading)
            
            VStack{
                Text(title!)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 5, alignment: .center)
                
                Text("Rs. \(price!)")
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 15, alignment: .center)
                
                Text(storeName!)
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

func ProductWishListView(image: UIImage? = UIImage(), title: String? = "", price: String? = "", storeName: String? = "", action: @escaping () -> Void) -> some View{
    return VStack{
        HStack{
            Image(uiImage: image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .leading)
            
            VStack{
                Text(title!)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 5, alignment: .center)
                
                Text("Rs. \(price!)")
                    .frame(width: 250, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: 250, height: 15, alignment: .center)
                
                Text(storeName!)
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 250, height: 20, alignment: .leading)
            }
            
            Rectangle()
                .frame(width: 20, height: 5, alignment: .leading)
                .foregroundColor(.red)
                .onTapGesture {
                    action()
                }
            
        }.padding(.horizontal, 25)
        .frame(width: Constants.screenWidth, height: 120, alignment: .leading)
        
        Rectangle()
            .padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 1, alignment: .center)
            .foregroundColor(Color(UIColor.systemGray3))
    }
}
