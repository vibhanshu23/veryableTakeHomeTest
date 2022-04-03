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
    
    //MARK: Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    
    func setup(){
        constrain()
    }
    
    //MARK: Constraints
    
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
    
    //MARK: Lazy Loads
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        addSubview(view)
        return view
    }()
    
    lazy var lblAccountName: UILabel = {
        let label = UILabel()
        label.text = "@lblAccountName"
        label.textAlignment = .left
        label.textColor = VCustomGrey.normal.color
        label.font = .vryAvenirNextDemiBold(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(label)
        return label
    }()
    
    lazy var lblDesc: UILabel = {
        let label = UILabel()
        label.text = "@lblDesc"
        label.textAlignment = .left
        label.textColor = VCustomGrey.normal.color
        label.font = .vryAvenirNextRegular(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(label)
        return label
    }()
    
    lazy var lblTertiary: UILabel = {
        let label = UILabel()
        label.text = "@lblTertiary"
        label.textColor = VCustomGrey.light.color
        label.font = .vryAvenirNextRegular(12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(label)
        return label
    }()
    
    lazy var imgDisplayType:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 0
        img.clipsToBounds = true
        img.tintColor = UIColor.blue
        cardView.addSubview(img)
        return img
    }()
    
    lazy var imgRightArrow:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 0
        img.clipsToBounds = true
        img.image = UIImage(named: "arrow")
        cardView.addSubview(img)
        return img
    }()
    
    //MARK: Overrides
    override func layoutSubviews() {
        let templateImage = imgDisplayType.image?.withRenderingMode(.alwaysTemplate)
        imgDisplayType.image = templateImage
        imgDisplayType.tintColor = VBlue.normal.color
    }
    
}
