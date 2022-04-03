//
//  Router.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class Router{
    //MARK: Account List - GET
    
    static func getAccountList(finished:@escaping (_ response:[AccountModal]) -> Void){
        
        AF.request("https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json").responseDecodable(of: [AccountModal].self) { response in
            
            switch response.result {
            case .success(let post):
                finished(post)
                
            case .failure(let error):
                print("Failed with error: \(error)")
                finished([])
            }
        }
        
    }
}


//MARK: dump Code

//response
//[
//    {
//             "id": 101,
//        "account_type":"bank",
//        "account_name":"WF Checking Account",
//        "desc": "Wells Fargo (x2356)"
//    },
//    {
//        "id": 102,
//        "account_type":"card",
//        "account_name":"WF Debit Card",
//        "desc": "VISA (x4363)"
//
//    }
//]

