//
//  UserData.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

struct UserData: Hashable, Codable {

    var id:Int
    var name:String
    var username:String
    var email:String
    var address:Address
}

struct Address: Hashable, Codable {
    
    var street:String
    var city:String
    var zipcode:String
}
