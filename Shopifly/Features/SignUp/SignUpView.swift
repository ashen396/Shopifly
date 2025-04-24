//
//  SignUpView.swift
//  Shopifly
//
//  Created by Mac on 3/29/25.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View{
    @State private var fname = ""
    @State private var lname = ""
    @State private var email = ""
    @State private var mobile = ""
    @State private var location = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isChecked = false
    
    @State private var alertVisible: Bool = false
    @State private var errorMessage: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View{
        VStack{
            Text("Sign Up")
                .font(.system(size: 40))
                .fontWeight(.bold)
            
            VStack{
                Group{
                    CustomTextField(title: "First Name", bindState: $fname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Last Name", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Email", bindState: $email)
                   
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Mobile", bindState: $mobile)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Location", bindState: $location)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    PasswordTextField(title: "Password", password: $password, showPassword: $showPassword)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    PasswordTextField(title: "Confirm Password", password: $confirmPassword, showPassword: $showPassword)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
            }
            
            Toggle("By clicking the checkbox, you accept to follow the terms and conditions. View terms & conditions", isOn: $isChecked)
                .padding(.horizontal, 40)
            
            CustomButton(title: "Continue", foregroundColor: .white, backgroundColor: .blue) {
                if(isChecked == true){
                    if(password == confirmPassword){
                        Auth.auth().createUser(withEmail: email, password: password) { (result: AuthDataResult?,error: Error?) in
                            if(error != nil){
                                errorMessage = error.debugDescription.description
                                alertVisible = true
                                return
                            }else{
                                result?.user.sendEmailVerification(completion: { (verificationError: Error?) in
                                    
                                    if(error != nil){
                                        errorMessage = error.debugDescription.description
                                        alertVisible = true
                                        return
                                    }
                                    
                                    Firestore.firestore().collection("Users").addDocument(data: ["FirstName" : fname, "LastName": lname, "Email": email, "Mobile": mobile, "Location": location])
                                    
                                })
                            }
                        }
                    }else{
                        errorMessage = "Passwords do not match"
                        alertVisible = true
                    }
                }else{
                    errorMessage = "Accept Terms & Conditions"
                    alertVisible = true
                }
            }.alert(isPresented: $alertVisible, content: {
                Alert(title: Text("Sign Up Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })

        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SignUpView_Preview: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
