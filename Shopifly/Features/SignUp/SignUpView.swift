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
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack{
                CustomTextField(title: "First Name", bindState: $fname)
                
                CustomTextField(title: "Last Name", bindState: $lname)
                
                CustomTextField(title: "Email", bindState: $lname)
                
                CustomTextField(title: "Mobile", bindState: $lname)
                
                CustomTextField(title: "Location", bindState: $lname)
                
                CustomTextField(title: "Password", bindState: $lname)
                
                CustomTextField(title: "Confirm Password", bindState: $lname)
            }
            
            Toggle("By clicking the checkbox, you accept to follow the terms and conditions. View terms & conditions", isOn: $isChecked)
            
            NavigationButton(title: "Continue", foregroundColor: Color.white, backgroundColor: Color.blue, destination: OTPView())

        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SignUpView_Preview: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
