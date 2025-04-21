//
//  HomescreenView.swift
//  Shopifly
//
//  Created by Mac on 4/10/25.
//

import Foundation
import SwiftUI
import FirebaseStorage
import CoreData

struct HomescreenView: View{
    
    @State private var search = ""
    @State var firstImage: UIImage = UIImage()
    @State var imgData: Data = Data()
    @State var cardImages: [UIImage] = [UIImage()]
    @State var favCards: [Favourites] = []
    
    func FetchImage(){
        Storage.storage().reference(withPath: "RedShoe.png").getData(maxSize: 5 * 1024 * 1024) { (data, error) in
                DispatchQueue.main.async {
                    if let imageData = data, let image = UIImage(data: imageData){
                        firstImage = image
                        imgData = data!
                    }
                }
        }
    }
    
    func Save(){
        let container = NSPersistentContainer(name: "CardModel")
        
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        let cntx = container.viewContext
        
        let newModel = CardModelEntity(context: cntx)
        newModel.location = "Loc01"
        newModel.product = "Prod01"
        newModel.image = imgData
        
        do{
            try cntx.save()
            print("Saved")
        }catch{
            print("Failed Saving")
        }
    }
    
    func GetData(){
        let container = NSPersistentContainer(name: "CardModel")
        
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
        }
        
        let fetchReq: NSFetchRequest<CardModelEntity> = CardModelEntity.fetchRequest()

        let cntx = container.viewContext
        
        
        do{
            let data = try cntx.fetch(fetchReq)
            data.forEach { (CardModelEntity) in
                print("Loc: \(String(describing: CardModelEntity.location)); Product:  \(String(describing: CardModelEntity.product))")
                if(CardModelEntity.image != nil){
                    firstImage = UIImage(data: CardModelEntity.image!)!
                }
            }
        }catch{
            print("Failed Reading")
        }
        
    }
    
    func FetchData(){
        GetImageList(collection: "Promotions") { (data) in
            cardImages = data
        }
        
        GetDataList(collection: "Favourites") { (data) in
            favCards = data
        }
    }
    
    var body: some View{
        VStack{
            Spacer()
                .frame(width: Constants.screenWidth, height: 25, alignment: .center)
            
            //Header
            HStack{
                HStack{
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                    
                    Text("Shopifly")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("John Doe")
                            .font(.title2)
                        
                        Text("Colombo")
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                    
                    Spacer()
                        .frame(width: 5, height: 25, alignment: .center)
                }
            }.padding(.horizontal, 25)
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
    
            CustomImageTextField(title: "Search", bindState: $search, imageName: "magnifyingglass")
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                CardStack(imageList: cardImages)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                
                //Products
                VStack{
                    HStack{
                        Text("Nearby Favourites")
                            .font(.title3)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text("Show All")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                    }.padding(.horizontal, 25)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    //Product Cards
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(favCards, id: \.self) { (elem: Favourites) in
                                ProductCardView(image: elem.image, backgroundColor: elem.backgroundColor, title: elem.title, price: elem.price, storeName: elem.shop)
                            }
                        }
                    }
                }
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                Text("Recommendations")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                
                LazyVStack{
                    NavigationLink(
                        destination: ProductNavigationView(),
                        label: {
                            ProductListView()
                    })
                    ProductListView()
                    ProductListView()
                    ProductListView()
                }
            }
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .gesture(DragGesture())
        .onAppear(perform: {
            FetchData()
        })
    }
}

struct HomescreenView_Preview: PreviewProvider{
    static var previews: some View{
        HomescreenView()
    }
}
