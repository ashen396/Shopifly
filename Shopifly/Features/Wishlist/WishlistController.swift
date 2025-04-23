//
//  WishlistController.swift
//  Shopifly
//
//  Created by Mac on 4/23/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore

func GetProductsByUserID(collection: String, fieldName: String, userID: String, completion: @escaping ([Product]) -> Void){
    
    var products: [Product] = []
    Firestore.firestore().collection(collection).whereField(fieldName, isEqualTo: userID).getDocuments { (docs, error) in
        
        docs?.documents.forEach({ (document) in
            
            let doc = document.data()
            GetProductByID(collection: "Products", fieldName: "ProductID", productID: doc["ProductID"]! as! String) { (fetchedProduct) in
                products.append(fetchedProduct)
                completion(products)
            }
        })
    }
}
