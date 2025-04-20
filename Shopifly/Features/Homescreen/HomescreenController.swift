//
//  HomescreenController.swift
//  Shopifly
//
//  Created by Mac on 4/20/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage

private var imageList: [UIImage] = [UIImage()]

func GetImage(imageName: String, completion: @escaping (UIImage) -> Void){
    Storage.storage().reference(withPath: imageName).getData(maxSize: 5 * 1024 * 1024) { (data, error) in
        DispatchQueue.main.async {
            if let imageData = data, let image = UIImage(data: imageData){
                completion(image)
            }
        }
    }
}

func GetImageList(collection: String, completion: @escaping ([UIImage]) -> Void){
    Firestore.firestore().collection(collection).getDocuments { (data, error) in
        data?.documents.forEach({ (doc) in
            
            let data = doc.data()
            let imageName = String(describing: data["Image"]!)
            GetImage(imageName: imageName) { (image) in
                imageList.append(image)
                completion(imageList)
            }
        })
    }
}

func HomescreenController(){
    
}
