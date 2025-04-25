//
//  AddItemController.swift
//  Shopifly
//
//  Created by Mac on 4/25/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage
import MapKit

func AddImage(productImage: UIImage, productID: String, completion: @escaping (String) -> Void){
    let image = productImage
    let imageData = image.jpegData(compressionQuality: 0.8)
    let imageUUID = UUID().uuidString
    
    let metadata = StorageMetadata()
    metadata.contentType = "image/jpeg"
    
    Storage.storage().reference().child("products/\(productID)/\(imageUUID)").putData(imageData!, metadata: metadata) { (data, error) in
        if((error) != nil){
            print("AddImageError: \(String(describing: error))")
            return
        }else{
            completion(imageUUID)
        }
    }
}

struct NewProduct{
    var Name: String
    var Shop: String
    var Price: String
    var Location: CLLocationCoordinate2D
//    var ReceiptID: String
    var ProductImageID: String
}

func AddProduct(productName: String, productImage: UIImage, shop: String, price: String, location: CLLocationCoordinate2D){
    let productID = UUID().uuidString
    AddImage(productImage: productImage, productID: productID) { (imageID) in
        
        let loc = ["Longitude": location.longitude, "latitude": location.latitude]
        let product = ["ProductID": productID, "Name": productName, "Shop": shop, "Price": price, "Location": loc, "Image": imageID] as [String : Any]
        
        Firestore.firestore().collection("Products").addDocument(data: product) { (error) in
            if((error) != nil){
                print("Error Uploading Data")
            }else{
                print("Done Uploading Data")
            }
        }
    }
}
