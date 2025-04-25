//
//  WriteReviewController.swift
//  Shopifly
//
//  Created by Mac on 4/25/25.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

func SaveReview(productID: String, userID: String, comment: String, rating: String){
    
    let review = ["Comment": comment, "Date": String(describing: Date()), "ProductID": productID, "Rating": rating, "ReviewID": UUID().uuidString, "UserID": userID]
    Firestore.firestore().collection("Reviews").addDocument(data: review) { (error) in
        if((error) != nil){
            print("Error Uploading Data")
        }else{
            print("Done Uploading Data")
        }
    }
}
