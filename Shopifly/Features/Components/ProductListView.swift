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
//
//struct ProductListView_Preview: PreviewProvider{
//    static var previews: some View{
//        ProductListView()
//    }
//}
