//
//  AccountListModal.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/1/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class AccountListModal{
    
    static let shared = AccountListModal()
    
    var isInitialized = false
    var arrData = [[ModalAccount]]() //expose only get not set
    
    init(){
        getNetworkData()
    }
    
    func isInitializedForData()-> Bool{
        return isInitialized
    }
    
    func getData()-> [[ModalAccount]]{
        return arrData
    }
    
    func getNetworkData(){
        
        let request = AF.request("https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json")
        request.responseJSON { [self] (response) in
            print("Response \(response)")
            do {
              let myDataArray = try JSONDecoder().decode([ModalAccount].self, from: response.data!)
                print(myDataArray[0].id) // prints "Mustafa"
                
                let filteredArray1 = myDataArray.filter { $0.accountType == "bank" }
                let filteredArray2 = myDataArray.filter { $0.accountType == "card" }
                
                var combinedList = [[ModalAccount]]()
                combinedList.append(filteredArray1)
                combinedList.append(filteredArray2)
                self.arrData = combinedList

                self.isInitialized = true
                NotificationCenter.default.post(name: Notification.Name("Data Refreshed"), object: nil) //change hardcoding to global enum
            } catch(let error) {
              print(error)
            }
        }
//        Alamofire.request()
        
        //Code Process
        
//        func getItemsFromServer(completion: @escaping (Result<[Item],NetworkError>)
//                -> Void) {
//                let endpoint = "https://nicknguyen14.medium.com/about"
//
//                AF.request(endpoint, method: .get).responseJSON { response in
//                    guard let itemsData = response.data else {
//                        completion(.failure(.badResponse))
//                      return
//                    }
//                    do {
//                        let decoder = JSONDecoder()
//                        let items = try decoder.decode([Item].self, from: itemsData)
//                        DispatchQueue.main.async {
//                            completion(.success(items))
//                        }
//                    } catch {
//                        completion(.failure(.noData))
//                    }
//                }
//            }
        
    }
    
}

struct ModalAccount: Codable {
    let id: Int
    let accountType, accountName, desc: String

    enum CodingKeys: String, CodingKey {
        case id
        case accountType = "account_type"
        case accountName = "account_name"
        case desc
    }
}


//MARK: dump Code - Ignore

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


//ask network layer to fetch data if not initialized
//send delegate after completion of data download
//implement a function to return list of cards and accounts 2D Array
//Implement a function to return detail of card /account for a particular id
//implement a function to segregate the result into cards and banks

