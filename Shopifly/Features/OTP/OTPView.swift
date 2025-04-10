//
//  OTPView.swift
//  Shopifly
//
//  Created by Mac on 4/9/25.
//

import Foundation
import SwiftUI

struct OTPView: View{
    
    @State private var otp1 = ""
    @State private var otp2 = ""
    @State private var otp3 = ""
    @State private var otp4 = ""
    @State private var otp5 = ""
    @State private var otp6 = ""
    
    var body: some View{
        VStack{
            VStack{
                Text("Activation Code")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Code was sent to your email address")
            }
            
            VStack{
                HStack{
                    OTPTextField(title: "0", bindState: $otp1)
                    
                    OTPTextField(title: "0", bindState: $otp2)
                    
                    OTPTextField(title: "0", bindState: $otp3)
                    
                    OTPTextField(title: "0", bindState: $otp4)
                    
                    OTPTextField(title: "0", bindState: $otp5)
                    
                    OTPTextField(title: "0", bindState: $otp6, isLast: true)
                }
                
                Text("retry in 29 seconds")
                    .font(.body)
                    .foregroundColor(Color(UIColor.systemGray2))
                    .frame(width: 280, height: .none, alignment: .leading)
            }
        }
    }
}


struct OTPView_Preview: PreviewProvider{
    static var previews: some View{
        OTPView()
    }
}
