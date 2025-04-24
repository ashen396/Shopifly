//
//  ProductScreenController.swift
//  Shopifly
//
//  Created by Mac on 4/21/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage

func GetProductByID(collection: String, fieldName: String, productID: String, completion: @escaping (Product) -> Void){
    
    Firestore.firestore().collection(collection).whereField(fieldName, isEqualTo: productID).limit(to: 1).getDocuments { (docs, error) in
        let doc = docs?.documents[0]
        var product: Product = Product(productID: "", title: "", price: "", shop: "", image: UIImage())
        
        GetImage(imageName: String(describing: doc!["Image"]!)) { (image) in
            product.productID = String(describing: doc!["ProductID"]!)
            product.title = String(describing: doc!["Name"]!)
            product.price = String(describing: doc!["Price"]!)
            product.shop = String(describing: doc!["Shop"]!)
            product.backgroundColor = doc?["BackgroundColor"] as? [Double]
            product.image = image
            
            completion(product)
        }
    }
}

struct User: Hashable {
    var userID: String
    var username: String
    var userImage: UIImage
}

struct Review: Hashable {
    var user: User
    var rating: Int
    var comment: String
    var commentID: String
    var date: String
    var images: [UIImage]
}

func GetUserImage(imageName: String, completion: @escaping (UIImage) -> Void){
    Storage.storage().reference(withPath: imageName).getData(maxSize: 5 * 1024 * 1024) { (data, error) in
        DispatchQueue.main.async {
            if let imageData = data, let image = UIImage(data: imageData){
                completion(image)
            }
        }
    }
}

func GetUserByID(collection: String, fieldName: String, userID: String, completion: @escaping (User) -> Void){
    var data: User = User(userID: "", username: "", userImage: UIImage())
    
    Firestore.firestore().collection(collection).whereField(fieldName, isEqualTo: userID).getDocuments { (users, error) in
        users?.documents.forEach({ (doc) in
            let userData = doc.data()
            
            GetUserImage(imageName: String(describing: userData["UserImage"]!)) { (userImage) in
                data.userID = String(describing: userData["UserID"]!)
                data.username = String(describing: "@\(userData["FirstName"]!)\(userData["LastName"]!)")
                data.userImage = userImage

                completion(data)
            }
        })
    }
}

func GetImageArray(imageList: [String], completion: @escaping ([UIImage]) -> Void){
    var imageArray: [UIImage] = []
    imageList.forEach { (imageName) in
        Storage.storage().reference(withPath: imageName).getData(maxSize: 5 * 1024 * 1024) { (data, error) in
            DispatchQueue.main.async {
                if let imageData = data, let image = UIImage(data: imageData){
                    imageArray.append(image)
                    completion(imageArray)
                }
            }
        }
    }
}

func GetReviewsByProductID(collection: String, fieldName: String, productID: String, completion: @escaping ([Review]) -> Void){
    Firestore.firestore().collection(collection).whereField(fieldName, isEqualTo: productID).getDocuments { (docs, error) in
        var reviews: [Review] = []
        
        docs?.documents.forEach({ (document) in
            let docData = document.data()
            
            let imageArray: [String] = docData["Images"] == nil ? [] : docData["Images"] as! [String]
            var imageList: [UIImage] = [UIImage()]
            
            GetImageArray(imageList: imageArray) { fetchedImages in
                imageList = fetchedImages
            }
            
            GetUserByID(collection: "Users", fieldName: "UserID", userID: String(describing: docData["UserID"]!)) { (data) in
                
                let review = Review(user: data, rating: Int(String(describing: docData["Rating"]!))!, comment: String(describing: docData["Comment"]!), commentID: String(describing: docData["ReviewID"]!), date: String(describing: docData["Date"]!), images: imageList)


                reviews.sort { (review1, review2) -> Bool in
                   return review1.commentID > review2.commentID
                }
                reviews.append(contentsOf: [review])
                completion(reviews)
            }
        })
    }
    
}
