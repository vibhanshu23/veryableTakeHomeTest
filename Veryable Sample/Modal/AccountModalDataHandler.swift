//
//  AccountListModal.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/1/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

//MARK: DataHandler

class AccountModalDataHandler{
    
    static let shared = AccountModalDataHandler()
    
    var isInitialized = false
    private(set) var arrSortedData = [[AccountModal]]()
    private(set) var arrOriginalData = [AccountModal]()
    
    init(){
        getNetworkData()
    }
    
    func isInitializedForData()-> Bool{
        return isInitialized
    }
    
    func getData()-> [[AccountModal]]{
        return arrSortedData
    }
    
    func getNetworkData(){
        
        Router.getAccountList { response in
            print(response)
            let filteredArray1 = response.filter { $0.accountType == "bank" }
            let filteredArray2 = response.filter { $0.accountType == "card" }
            
            var combinedList = [[AccountModal]]()
            combinedList.append(filteredArray1)
            combinedList.append(filteredArray2)
            self.arrSortedData = combinedList
            self.arrOriginalData = response
            self.isInitialized = true
            NotificationCenter.default.post(name: Notification.Name("Data Refreshed"), object: nil)
            
            //Error scenario not given and hence not implemented.
            //Passed an array with count 0 in case of error
            
        }
    }
    
}





