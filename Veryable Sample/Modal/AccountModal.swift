//
//  AccountModal.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/3/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation

//MARK: Modal - account

struct AccountModal: Codable {
    let id: Int
    let accountType, accountName, desc: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountType = "account_type"
        case accountName = "account_name"
        case desc
    }
}
