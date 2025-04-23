//
//  UserProfileView.swift
//  Shopifly
//
//  Created by Mac on 4/13/25.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var userID: String = ""
    @State var userImage: UIImage = UIImage()
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: userImage)
                    .resizable()
                    .frame(width: Constants.screenWidth / 2, height:  Constants.screenWidth / 2, alignment: .center)
            }.frame(width: Constants.screenWidth, height: Constants.screenWidth / 2, alignment: .center)
            .padding(.top, 100)
            
            Text("@\(userID)")
                .foregroundColor(Color.gray)
            
            HStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 125, height: 40, alignment: .center)
                    .foregroundColor(.red)
                    .overlay(
                        Text("Report")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
            }.padding(.top, 10)
            .frame(width: Constants.screenWidth, height: 75, alignment: .center)
            
            HStack{
                Text("Reviews")
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.horizontal, 25)
            .frame(width: Constants.screenWidth, height: 20, alignment: .leading)
            
            VStack{
            }
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .topLeading)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
