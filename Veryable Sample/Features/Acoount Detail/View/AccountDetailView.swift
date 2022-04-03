//
//  AccountDetailView.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountDetailDelegate: AnyObject {
    
    func onClickDone()
    
}

class AccountDetailView: UIView {

    //MARK: Public API

    //MARK: Inits
    init(delegate: AccountDetailDelegate) {
        super.init(frame: .zero)
        self.del = delegate
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

    override func layoutSubviews() {
        let templateImage = imgDisplayType.image?.withRenderingMode(.alwaysTemplate)
        imgDisplayType.image = templateImage
        imgDisplayType.tintColor = VBlue.normal.color
    }
    
    
    private func setup() {
        backgroundColor = .white
        
        constrain()
    }

    private func constrain() {

        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        cardView.snp.makeConstraints {
            $0.leading.equalTo(0)
            $0.trailing.equalTo(0)
            $0.top.equalTo(self).offset(topPadding + 44) // safe area + navgationBar height
            $0.bottom.equalTo(0).offset(-bottomPadding) // - safe area
            $0.width.equalTo(self).offset(0)
            
        }
        
        imgDisplayType.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(cardView).offset(32)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        
        
        lblAccountName.snp.makeConstraints {
            $0.top.equalTo(imgDisplayType).offset(100 + 16)
            $0.centerX.equalTo(imgDisplayType)

//            $0.leading.equalTo(imgDisplayType).offset(40 + 32)
//            $0.trailing.equalTo(cardView).offset(-32-40-32)
//            $0.height.equalTo(40)
        }
        lblDesc.snp.makeConstraints {
            $0.top.equalTo(lblAccountName).offset(32)
            $0.centerX.equalTo(lblAccountName)
//            
//            $0.leading.equalTo(lblAccountName)
//            $0.trailing.equalTo(lblAccountName)
//            $0.top.equalTo(lblAccountName).offset(24)
//            $0.height.equalTo(40)
        }
        
        btnDone.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.bottom.equalTo(cardView).offset(-16) //check minus safe area
            $0.height.equalTo(50)
            $0.width.equalTo(cardView).offset(-34)
        }
        
        
        
    }

    //MARK: Overrides

    //MARK: Private members
    private var item : ModalAccount?
    private weak var del: AccountDetailDelegate?


    //MARK: Lazy Loads
    lazy var cardView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = VCustomGrey.header.color
        addSubview(view)

       return view
    }()
    
   
    
    lazy var lblAccountName: UILabel = {
       let label = UILabel()
       label.text = ""
       label.textAlignment = .left
        label.textColor = VCustomGrey.normal.color
        label.font = .vryAvenirNextDemiBold(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

       return label
    }()
    lazy var lblDesc: UILabel = {
       let label = UILabel()
       label.text = ""
       label.textAlignment = .left
        label.textColor = VCustomGrey.light.color
        label.font = .vryAvenirNextDemiBold(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

       return label
    }()
    lazy var imgDisplayType : UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.clipsToBounds = true

            addSubview(img)
            return img
    }()
    
    lazy var btnDone :UIButton = {
       
        let btn = UIButton()
        btn.setTitle("DONE", for: .normal)
        btn.addTarget(self, action: #selector(onClickDone), for: .touchUpInside)
        btn.backgroundColor = VBlue.normal.color
        btn.layer.cornerRadius = 4
//        btn.layer.shadowOffset = //check
        btn.titleLabel?.font = .vryAvenirNextBold(16)
        addSubview(btn)
        return btn
        
    }()
    
    @objc func onClickDone(sender: UIButton!) {
        self.del?.onClickDone()
    }

}
