//
//  PasswordTextField.swift
//  Shopifly
//
//  Created by Mac on 4/24/25.
//

import Foundation
import SwiftUI

struct PasswordTextField: View {
    
    @State var title: String = "Password"
    @Binding var password: String
    @Binding var showPassword: Bool

    var body: some View{
        HStack{
                if(showPassword == true){
                    TextField(title, text: $password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }else{
                    SecureField(title, text: $password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }.font(.title3)
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
        .frame(width: UIScreen.main.bounds.width - 50, height: 48)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}
