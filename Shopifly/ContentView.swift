//
//  ContentView.swift
//  Shopifly
//
//  Created by Mac on 3/29/25.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    private var strokeColorOne = [Color(red: 0, green: 0, blue: 255, opacity: 1), Color( red: 255, green: 0, blue: 0, opacity: 1)]
    
    var body: some View {
        VStack{
            
            // Heading
            VStack{
                Text("Shopifly")
                    .font(.system(size: 54))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("Review products to share experience with others")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: .none, alignment: .center)
            }.frame(width: .none, height: .none, alignment: .top)
            .padding(.top, 50)
            
            VStack{
                // Email Textfield
                TextField("Email", text: $email)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    .frame(width: 314, height: 40)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                // Password Textfield
                TextField("Password", text: $password)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    .frame(width: 314, height: 40)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                // Forgot Password
                HStack{
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                        .font(.caption)
                }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 20, idealHeight: 20, maxHeight: 20, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                .padding(.top, 10)
                .padding(.bottom, 25)
                
                // Login Button
                Button("Continue") {
                    
                }.frame(minWidth: 0, idealWidth: 314, maxWidth: 314, minHeight: 0, idealHeight: 44, maxHeight: 44, alignment: .center)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                // Separator
                HStack{
                    Rectangle()
                        .frame(width: 140, height: 3, alignment: .center)
                        .overlay(LinearGradient(gradient: Gradient(colors: [Color.white, Color(UIColor.systemGray4)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(3.0)
                    
                    Text("OR")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.systemGray2))
                    
                    Rectangle()
                        .frame(width: 140, height: 3, alignment: .center)
                        .overlay(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray4), Color.white]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(3.0)
                }.padding(.top, 15)
                
                VStack{
                    
                    // Login with Apple Button
                    Button("Continue with Apple") {
                        
                    }.frame(minWidth: 0, idealWidth: 314, maxWidth: 314, minHeight: 0, idealHeight: 44, maxHeight: 44, alignment: .center)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                    // Login with Google Button
                        Button("Continue with Google") {
                            
                        }.frame(minWidth: 0, idealWidth: 310, maxWidth: 314, minHeight: 0, idealHeight: 44, maxHeight: 44, alignment: .center)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black)
                           ).padding(.top, 15)
                    
                }.padding(.top, 15)
                
                Text("By continuing, you agree to Shopifly’s Terms & Conditions")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 216, height: 40, alignment: .bottom)
                
            }.padding(.top, 120)
            .padding(.bottom, 20)
            
        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
