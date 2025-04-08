//
//  Login.swift
//  Shopifly
//
//  Created by yr4cobsccomp232p-044 on 3/29/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View{
        NavigationView{
        VStack{
            
            // Heading
            VStack{
                Text("Shopifly")
                    .font(.system(size: 54))
                    .fontWeight(.bold)
//                    .padding(.bottom, 20)
                
                Text("Review products to share experience with others")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: .none, alignment: .center)
            }.frame(width: .none, height: .none, alignment: .top)
//            .padding(.top, 50)
            
            VStack{
                // Email Textfield
                CustomTextField(title: "Email", bindState: $email)
                
                // Password Textfield
                CustomTextField(title: "Password", bindState: $password)
                
                // Forgot Password
                HStack{
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                        .font(.caption)
                }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 20, idealHeight: 20, maxHeight: 20, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                .padding(.bottom, 25)
                
                // Login Button
                CustomButton(title: "Continue", foregroundColor: Color.white, backgroundColor: Color.blue)

                
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
                    CustomButton(title: "Continue with Apple", foregroundColor: Color.white, backgroundColor: Color.black, function: {
                        SetData()
                    })
                    
                    // Login with Google Button
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            CustomButton(title: "Continue with Google", foregroundColor: Color.black, backgroundColor: Color.white, stroke: true, padding: 10)
                        })
                    
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
}

func SetData(){
    let database = Firestore.firestore()
    let docRef = database.document("Items/item01")
    docRef.setData(["text": "Hello World"])
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
