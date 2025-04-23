//
//  SearchscreenController.swift
//  Shopifly
//
//  Created by Mac on 4/23/25.
//

import Foundation
import FirebaseFirestore

func GetProductsByKeywords(collection: String, searchKeyword: String, completion: @escaping ([Product]) -> Void){
    var productArray: [Product] = []
    
    Firestore.firestore().collection(collection).whereField("Keywords", arrayContains: searchKeyword).getDocuments { (data, error) in
        data?.documents.forEach({ (doc) in
            
            let data = doc.data()
            let prodID = String(describing: data["ProductID"]!)
            let title = String(describing: data["Name"]!)
            let price = String(describing: data["Price"]!)
            let shop = String(describing: data["Shop"]!)
            let imageName = String(describing: data["Image"]!)
            GetImage(imageName: imageName) { (image) in
                
                let obj = Product(productID: prodID, title: title, price: price, shop: shop, image: image)
                productArray.append(obj)
                completion(productArray)
            }
        })
    }
}
