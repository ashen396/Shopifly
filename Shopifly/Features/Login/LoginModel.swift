//
//  LoginModel.swift
//  Shopifly
//
//  Created by Mac on 4/26/25.
//

import Foundation

struct UserModel {
    var firstName: String
    var lastName: String
    var email: String?

    var username: String {
        return firstName
    }

    var userId: String {
        return "\(firstName.lowercased())\(lastName.lowercased())"
    }
}
