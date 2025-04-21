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
    @State private var isChecked = false
    
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
                    CustomTextField(title: "Password", bindState: $password)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Confirm Password", bindState: $password)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
            }
            
            Toggle("By clicking the checkbox, you accept to follow the terms and conditions. View terms & conditions", isOn: $isChecked)
                .padding(.horizontal, 40)
            
            CustomButton(title: "Continue", foregroundColor: .white, backgroundColor: .blue) {
                Auth.auth().createUser(withEmail: email, password: password) { (result: AuthDataResult?,error: Error?) in
                    if(error != nil){
                        print("Error: \(String(describing: error))")
                        return
                    }else{
                        print("Result: \(String(describing: result?.user.uid))")
                        
                        result?.user.sendEmailVerification(completion: { (verificationError: Error?) in
                            
                            if(error != nil){
                                print("Error: \(String(describing: error))")
                                return
                            }
                            
                            print("IsValid: \(String(describing: result?.user.isEmailVerified))")
                            
                            Firestore.firestore().collection("Users").addDocument(data: ["FirstName" : fname, "LastName": lname, "Email": email, "Mobile": mobile, "Location": location])
                            
                        })
                    }
                }
            }

        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SignUpView_Preview: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
