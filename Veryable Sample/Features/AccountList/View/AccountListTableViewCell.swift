//
//  AccountListTableViewCell.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit


class AccountListTableViewCell : UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "cell")
        
        setup()
    }
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
//        cardView.addSubview(usernameLabel)
        self.contentView.addSubview(cardView)
        cardView.addSubview(imgDisplayType)
        cardView.addSubview(lblAccountName)
        cardView.addSubview(lblDesc)
        cardView.addSubview(lblTertiary)
        constrain()
        
        
        
        
    }
    private func constrain() {
        cardView.snp.makeConstraints {
            $0.leading.equalTo(0)
            $0.trailing.equalTo(0)
            $0.top.equalTo(0)
            $0.bottom.equalTo(0)
            $0.height.equalTo(contentView)
            $0.width.equalTo(contentView)
            
        }
        imgDisplayType.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.top.equalTo(32)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
        
        
        lblAccountName.snp.makeConstraints {
            $0.top.equalTo(imgDisplayType)

            $0.leading.equalTo(imgDisplayType).offset(40 + 32)
            $0.trailing.equalTo(cardView).offset(-32-40-32)
            $0.height.equalTo(40)
        }
        lblDesc.snp.makeConstraints {
            $0.leading.equalTo(lblAccountName)
            $0.trailing.equalTo(lblAccountName)
            $0.top.equalTo(lblAccountName).offset(24)
            $0.height.equalTo(40)
        }
        lblTertiary.snp.makeConstraints {
            $0.leading.equalTo(lblAccountName)
            $0.trailing.equalTo(lblAccountName)
            $0.top.equalTo(lblDesc).offset(24)
            $0.height.equalTo(40)
        }
        
        
    }
    
    private lazy var cardView: UIView = {
       let view = UIView()
       view.layer.cornerRadius = 14
       view.backgroundColor = .red
       view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
       return view
    }()
    
    lazy var lblAccountName: UILabel = {
       let label = UILabel()
       label.text = "@lblAccountName"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    lazy var lblDesc: UILabel = {
       let label = UILabel()
       label.text = "@lblDesc"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    lazy var lblTertiary: UILabel = {
       let label = UILabel()
       label.text = "@lblTertiary"
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    let imgDisplayType:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 35
             img.clipsToBounds = true
        img.backgroundColor = .purple
            return img
    }()
    
}
