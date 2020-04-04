//
//  mainData.swift
//  Bank
//
//  Created by Alexei Mashkov on 20.03.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import Foundation
import Alamofire

let URL_USER_REGISTER = "https://mashkov.dev/sites/default/BankApp/Register.php"

class Defaults {
    var isLoggedIn : Bool? = UserDefaults.standard.bool(forKey: "isLoggedIn")
    static var login : String = ""
    static var password : String = ""
}

struct ClientsInfo {
    let firstName : String
    let secondName : String
    let age : Int
    let country : String
    let passport : String
    let isCurrent : Bool
    let status : String
}

class httpsClientsRequests {
    let URL_USER_REGISTER = "https://mashkov.dev/sites/default/BankApp/Register.php"
    
    
    
}


class Countries {
    static let countries = ["", "Россия", "Украина", "США", "Беларусь", "Казахстан", "Германия", "Китай"]
}
