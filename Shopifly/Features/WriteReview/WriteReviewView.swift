//
//  WriteReview.swift
//  Shopifly
//
//  Created by Mac on 4/15/25.
//

import SwiftUI

struct WriteReviewView: View {
    
    @State private var review: String = ""
    @State private var showImagePicker = false
    @State private var image: UIImage? = UIImage()
    @State private var image2: UIImage? = UIImage()
    @State var productID: String = ""
    @State private var rateCount: Int = 1
    
    var body: some View {
        VStack{
            ScrollView{
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
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    HStack{
                        AddImageButton()
                            .onTapGesture {
                                showImagePicker = true
                            }
                    }.padding(.leading, 25)
                    .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                    
                    Image(uiImage: image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                        .padding()
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                    }) {
                        ImagePicker(selectedImage: $image)
                    }
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
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    HStack{
                        AddImageButton()
                            .onTapGesture {
                                showImagePicker = true
                            }
                    }.padding(.leading, 25)
                    .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                    
                    Image(uiImage: image2!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                        .padding()
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                    }) {
                        ImagePicker(selectedImage: $image2)
                    }
                }
                
                VStack{
                    Group{
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 40, alignment: .center)
                        
                        HStack{
                            Text("Review")
                                .font(.title)
                                .fontWeight(.bold)
                        }.padding(.horizontal, 25)
                        .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    }
                    
                    HStack{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(Color.orange)
                            .onTapGesture(perform: {
                                rateCount = 1
                            })
                        
                        Spacer()
                            .frame(width: 5, height: 20, alignment: .center)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(rateCount >= 2 ? Color.orange : Color(UIColor.systemGray4))
                            .onTapGesture(perform: {
                                rateCount = 2
                            })
                        
                        Spacer()
                            .frame(width: 5, height: 20, alignment: .center)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(rateCount >= 3 ? Color.orange : Color(UIColor.systemGray4))
                            .onTapGesture(perform: {
                                rateCount = 3
                            })
                        
                        Spacer()
                            .frame(width: 5, height: 20, alignment: .center)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(rateCount >= 4 ? Color.orange : Color(UIColor.systemGray4))
                            .onTapGesture(perform: {
                                rateCount = 4
                            })
                        
                        Spacer()
                            .frame(width: 5, height: 20, alignment: .center)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(rateCount >= 5 ? Color.orange : Color(UIColor.systemGray4))
                            .onTapGesture(perform: {
                                rateCount = 5
                            })
                        
                    }.frame(width: 95, height: 20, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    Text("Write a short summary of the product and rate for others to know what you feel.")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .padding(.horizontal, 25)
                        .foregroundColor(Color.gray)
                        .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                    
                    HStack{
//                        RatingBar()
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 50, alignment: .leading)
                    
                    TextEditor(text: $review)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .frame(width: Constants.screenWidth, height: 200, alignment: .top)
                        .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .padding(.horizontal, 25)
                                .foregroundColor(Color.gray)
                                .frame(width: Constants.screenWidth, height: 200, alignment: .top)
                        )
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                    
                    CustomButton(title: "Post Review", foregroundColor: .white, backgroundColor: .blue)
                        .onTapGesture {
                            print("Triggered")
                            SaveReview(productID: productID, userID: UserDefaults.standard.string(forKey: "UserID")!, comment: review, rating: String(describing: rateCount))
                        }
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                }
            }
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct WriteReviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteReviewView()
    }
}
