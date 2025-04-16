//
//  SignUpView.swift
//  Shopifly
//
//  Created by Mac on 3/29/25.
//

import Foundation
import SwiftUI

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
                    CustomTextField(title: "Email", bindState: $lname)
                   
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Mobile", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Location", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Password", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
                
                Group{
                    CustomTextField(title: "Confirm Password", bindState: $lname)
                    
                    Spacer()
                        .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                }
            }
            
            Toggle("By clicking the checkbox, you accept to follow the terms and conditions. View terms & conditions", isOn: $isChecked)
                .padding(.horizontal, 40)
            
            NavigationButton(title: "Continue", foregroundColor: Color.white, backgroundColor: Color.blue, destination: OTPView())

        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SignUpView_Preview: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
