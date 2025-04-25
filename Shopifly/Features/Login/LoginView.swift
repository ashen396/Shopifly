//
//  Login.swift
//  Shopifly
//
//  Created by yr4cobsccomp232p-044 on 3/29/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var showPassword: Bool = false
    @State var alertVisible: Bool = false
    @State var isAuth: Bool = false
    
    private func Authentication(){
        
        Auth.auth().signIn(withEmail: email, password: password) { (loginResult, error) in
            
            if(error != nil){
                alertVisible = true
            }else{
                Firestore.firestore().collection("Users").whereField("Email", isEqualTo: email).getDocuments { (docs, error) in
                    let documents = docs?.documents
                    
                    documents?.forEach({ (doc) in
                        let userDefaults = UserDefaults.standard
                        let firstName = String(describing: doc["FirstName"]!)
                        let lastName = String(describing: doc["LastName"]!)
                        
                        userDefaults.set(String(describing: "\(firstName)"), forKey: "Username")
                        userDefaults.set(String(describing: "\(firstName.lowercased())\(lastName.lowercased())"), forKey: "UserID")
                        userDefaults.set(true, forKey: "isUserLogged")
                        
                        isAuth.toggle()
                    })
                }
            }
        }
    }
    
    var body: some View{
        NavigationView{
            let isUserLogged = UserDefaults.standard.bool(forKey: "isUserLogged")
            if(isUserLogged == true){
                HomeNavigationView()
            }else{
                VStack{
                    // Heading
                    VStack{
                        Text("Shopifly")
                            .font(.system(size: 54))
                            .fontWeight(.bold)
                        
                        Text("Rate products to share experience with others")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: .none, alignment: .center)
                            .padding(.top, 10)
                    }.frame(width: .none, height: .none, alignment: .top)
                    
                    VStack{
                        // Email Textfield
                        CustomTextField(title: "Email", bindState: $email)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                        
                        // Password Textfield
                        PasswordTextField(title: "Password", password: $password, showPassword: $showPassword)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: 15, alignment: .center)
                        
                        // Forgot Password
                        HStack{
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .font(.caption)
                        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 20, idealHeight: 20, maxHeight: 20, alignment: .trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                        .padding(.bottom, 25)
                        .padding(.trailing, 10)
                        
                        // Login Button
                        CustomButton(title: "Continue", foregroundColor: .white, backgroundColor: .blue, padding: 0) {
                            Authentication()
                        }.alert(isPresented: $alertVisible, content: {
                            Alert(title: Text("Login Error"), message: Text("Error Login"), dismissButton: .default(Text("OK")))
                        })
                        
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
                            NavigationButton(title: "Continue with Apple", foregroundColor: Color.white, backgroundColor: Color.black, stroke: false, padding: 0, destination: SignUpView())
                            
                            Spacer()
                                .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                            
                            // Login with Google Button
                            NavigationButton(title: "Continue with Google", foregroundColor: Color.black, backgroundColor: Color.white, stroke: true, padding: 0, destination: SignUpView())
                        }.padding(.top, 15)
                        
                        Spacer()
                            .frame(width: Constants.screenWidth, height: Constants.spacingHeight, alignment: .center)
                        
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
        }.padding(.top, -25)
    }
}
//var count = 0
func SetData(){
//    let database = Firestore.firestore()
//    let docRef = database.document("Items/item\(count)")
//    docRef.setData(["text": "Hello World"])
//    count = count + 1
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
