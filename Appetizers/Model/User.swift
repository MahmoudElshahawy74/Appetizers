//
//  User.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
