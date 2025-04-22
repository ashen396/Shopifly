//
//  WriteReview.swift
//  Shopifly
//
//  Created by Mac on 4/15/25.
//

import SwiftUI

struct WriteReviewView: View {
    
    @State private var review: String = ""
    
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
                }
                
                VStack{
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 40, alignment: .center)
                    
                    HStack{
                        Text("Review")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 25)
                    .frame(width: Constants.screenWidth, height: 30, alignment: .leading)
                    
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
