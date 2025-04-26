//
//  LoginController.swift
//  Shopifly
//
//  Created by Mac on 4/24/25.
//

//import Foundation
//import FirebaseAuth
//import FirebaseFirestore
//
//class LoginController: ObservableObject {
//    @Published var alertVisible = false
//    @Published var isAuthenticated = false
//    
//    @Published var showPassword: Bool = false
//    @Published var alertVisible: Bool = false
//    @Published var isAuth: Bool = false
//    
//    private func Authentication(){
//        
//        Auth.auth().signIn(withEmail: email, password: password) { (loginResult, error) in
//            
//            if(error != nil){
//                alertVisible = true
//            }else{
//                Firestore.firestore().collection("Users").whereField("Email", isEqualTo: email).getDocuments { (docs, error) in
//                    let documents = docs?.documents
//                    
//                    documents?.forEach({ (doc) in
//                        let userDefaults = UserDefaults.standard
//                        let firstName = String(describing: doc["FirstName"]!)
//                        let lastName = String(describing: doc["LastName"]!)
//                        
//                        userDefaults.set(String(describing: "\(firstName)"), forKey: "Username")
//                        userDefaults.set(String(describing: "\(firstName.lowercased())\(lastName.lowercased())"), forKey: "UserID")
//                        userDefaults.set(true, forKey: "isUserLogged")
//                        
//                        isAuth.toggle()
//                    })
//                }
//            }
//        }
//    }
//}
