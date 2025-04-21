//
//  SettingsView.swift
//  Shopifly
//
//  Created by Mac on 4/15/25.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var fname: String = "John"
    @State private var lname: String = "Doe"
    @State private var mobile: String = "+94 000 0000"
    @State private var location: String = "Colombo"
    @State private var password: String = "********"
    @State private var confirmPassword: String = "********"
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        VStack{
            Image("UserProfilePic")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: 20, alignment: .center)
            
            Text("@JohnDoe")
                .font(.body)
                .foregroundColor(Color.gray)
            
            Spacer()
                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
            
            Group{
                ScrollView(.vertical, showsIndicators: true, content: {
                    CustomTextField(title: "First Name", bindState: $fname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    CustomTextField(title: "Last Name", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    CustomTextField(title: "Mobile", bindState: $mobile)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    CustomTextField(title: "Location", bindState: $location)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                    
                    CustomTextField(title: "Password", bindState: $password)
                    
                    CustomTextField(title: "Confirm Password", bindState: $confirmPassword)
                })
                
                CustomButton(title: "Update", foregroundColor: .white, backgroundColor: .blue)
            }
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight - 150, alignment: .top)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .gesture(DragGesture())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
