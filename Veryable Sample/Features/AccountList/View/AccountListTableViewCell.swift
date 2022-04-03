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
        cardView.addSubview(imgRightArrow)
        
        constrain()
        
        
        
        
    }
    private func constrain() {
        
        cardView.snp.makeConstraints {
            $0.leading.equalTo(0)
            $0.trailing.equalTo(0)
            $0.top.equalTo(0)
            $0.bottom.equalTo(0)
            $0.height.equalTo(contentView)
            $0.width.equalTo(contentView).offset(0)
            
        }
        imgDisplayType.snp.makeConstraints {
            $0.leading.equalTo(16)
            $0.top.equalTo(16)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        
        lblAccountName.snp.makeConstraints {
            $0.top.equalTo(imgDisplayType)

            $0.leading.equalTo(imgDisplayType).offset(24 + 16) //image width + padding
            $0.trailing.equalTo(cardView).offset(8-16-16) // padding - arraow width - arrow trailing
        }
        lblDesc.snp.makeConstraints {
            $0.leading.equalTo(lblAccountName)
            $0.trailing.equalTo(lblAccountName)
            $0.top.equalTo(lblAccountName).offset(24)
        }
        lblTertiary.snp.makeConstraints {
            $0.leading.equalTo(lblAccountName)
            $0.trailing.equalTo(lblAccountName)
            $0.top.equalTo(lblDesc).offset(24)
        }
        imgRightArrow.snp.makeConstraints {
            $0.centerY.equalTo(cardView)
            $0.trailing.equalTo(8-24) // padding - width
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        
    }
    
    private lazy var cardView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
       return view
    }()
    
    lazy var lblAccountName: UILabel = {
       let label = UILabel()
       label.text = "@lblAccountName"
       label.textAlignment = .left
        label.textColor = VCustomGrey.normal.color
        label.font = .vryAvenirNextDemiBold(14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    lazy var lblDesc: UILabel = {
       let label = UILabel()
       label.text = "@lblDesc"
       label.textAlignment = .left
        label.textColor = VCustomGrey.normal.color
        label.font = .vryAvenirNextRegular(12)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    lazy var lblTertiary: UILabel = {
       let label = UILabel()
       label.text = "@lblTertiary"
        label.textColor = VCustomGrey.light.color
        label.font = .vryAvenirNextRegular(12)
       label.textAlignment = .left
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    let imgDisplayType:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 0
             img.clipsToBounds = true
        img.tintColor = UIColor.blue
            return img
    }()
    
    let imgRightArrow:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 0
             img.clipsToBounds = true
        img.image = UIImage(named: "arrow")
            return img
    }()
 
    override func layoutSubviews() {
        let templateImage = imgDisplayType.image?.withRenderingMode(.alwaysTemplate)
        imgDisplayType.image = templateImage
        imgDisplayType.tintColor = VBlue.normal.color
    }
    
}
