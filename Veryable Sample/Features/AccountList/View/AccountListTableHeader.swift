//
//  AccountListTableHeader.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AccountListTableHeader: UITableViewHeaderFooterView {


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.backgroundColor = VCustomGrey.header.color

//        cardView.snp.makeConstraints {
//            $0.leading.equalTo(0)
//            $0.trailing.equalTo(0)
//            $0.top.equalTo(0)
//            $0.bottom.equalTo(0)
//            $0.height.equalTo(contentView)
//            $0.width.equalTo(contentView).offset(0)
//
//        }
        lblHeader.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(16)
        }
             
    }
    
    lazy var lblHeader: UILabel = {
       let label = UILabel()
       label.text = "@lblDesc"
       label.textAlignment = .left
        label.textColor = VCustomGrey.headerTitle.color
        label.font = .vryAvenirNextBold(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

       return label
    }()
}
