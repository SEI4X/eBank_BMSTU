//
//  AddHTTPS.swift
//  Bank
//
//  Created by Alexei Mashkov on 15.04.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import Foundation
import Alamofire

class AddClient {
    
    let URL_USER_REGISTER = "https://mashkov.dev/sites/default/BankApp/Register.php"
    
    func addClient() {
        
        let parametrs: Parameters = [
            "first_name" : AddClientViewController.firstName,
            "second_name" : AddClientViewController.secondName,
            "passport_number" : AddClientViewController.passport,
            "birthday" : AddClientViewController.date,
            "country" : AddClientViewController.country,
        ]
        
        AF.request(URL_USER_REGISTER, method: .post, parameters: parametrs).responseJSON
        {
            response in
            
            
            //printing response
            print(response)
            
            //getting the json value from the server
            if let result = response.value {
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                //displaying the message in label
                AddClientViewController.message = (jsonData.value(forKey: "message")) as! String
            }
        }
    }
}
