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

struct Favourites: Hashable{
    var title: String
    var price: String
    var shop: String
    var image: UIImage
    var backgroundColor: Color
}

func GetDataList(collection: String, completion: @escaping ([Favourites]) -> Void){
    var dataArray: [Favourites] = []
    
    Firestore.firestore().collection(collection).getDocuments { (data, error) in
        data?.documents.forEach({ (doc) in
            
            let data = doc.data()
            let title = String(describing: data["Title"]!)
            let price = String(describing: data["Price"]!)
            let shop = String(describing: data["Shop"]!)
            let imageName = String(describing: data["Image"]!)
            let bColorArray: [Any] = data["BackgroundColor"] as! [Any]
            let bRed: Double = bColorArray[0] as! Double
            let bGreen: Double =  bColorArray[1] as! Double
            let bBlue: Double =  bColorArray[2] as! Double
            let bAlpha: Double =  bColorArray[3] as! Double
            let backgroundColor = Color(red: bRed, green: bGreen, blue: bBlue, opacity: bAlpha)
            GetImage(imageName: imageName) { (image) in
                
                let obj = Favourites(title: title, price: price, shop: shop, image: image, backgroundColor: backgroundColor)
                dataArray.append(obj)
                completion(dataArray)
            }
        })
    }
}

func HomescreenController(){
    
}
