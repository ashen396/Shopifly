//
//  AddItemView.swift
//  Shopifly
//
//  Created by Mac on 4/14/25.
//

import SwiftUI
import MapKit

struct AddItemView: View {
    @State private var showImagePicker = false
        @State private var image: UIImage? = UIImage()
    
    @State private var productName: String = ""
    @State private var storeName: String = ""
    @State private var price: String = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.9721, longitude: 79.8612), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    let locationMan = CLLocationManager()
    
    @Binding var pageIndex:Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Add Review")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                
            Spacer()
                .frame(width: Constants.screenWidth, height: 40, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: true){
                VStack{
                    HStack{
                        Text("Product Description")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                    
                    VStack{
                        CustomTextField(title: "Product Name", bindState: $productName)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                        
                        CustomTextField(title: "Store Name", bindState: $storeName)
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                        
                        CustomTextField(title: "Price", bindState: $price)
                    }
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 40, alignment: .center)
                }

                VStack{
                    HStack{
                        Text("Store Location")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 25, alignment: .center)
                    
                    Map(coordinateRegion: $region, showsUserLocation: true)
                        .ignoresSafeArea()
                        .onAppear(perform: {
                            locationMan.requestWhenInUseAuthorization()
                        }).frame(width: Constants.screenWidth - 50, height: 200, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 6, x: 2.0, y: 2.0)
                }
                
                VStack{
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 40, alignment: .center)
                    
                    HStack{
                        Text("Upload Receipt")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    Text("Attach a photo or capture the image of the receipt of the item for proof.")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .padding(.horizontal, 25)
                        .foregroundColor(Color.gray)
                        .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                    
                    CustomButton(title: "Choose Image", foregroundColor: .white, backgroundColor: .blue)
                }
                
                VStack{
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 40, alignment: .center)
                    
                    HStack{
                        Text("Upload Images")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    Text("Attach or capture images of the product to share the moments and experiences with others.")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .padding(.horizontal, 25)
                        .foregroundColor(Color.gray)
                        .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                    
                    Image(uiImage: image!)
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 300, height: 300)
                                       .cornerRadius(12)
                    
                    CustomButton(title: "Choose Image", foregroundColor: .white, backgroundColor: .blue) {
                        showImagePicker = true
                    }.padding()
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                        pageIndex = 2
                    }) {
                        ImagePicker(selectedImage: $image)
                    }
                }
            }
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 120, alignment: .top)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .gesture(DragGesture())
    }
}
