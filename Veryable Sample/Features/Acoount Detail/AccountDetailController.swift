//
//  AccountDetail.swift
//  Veryable Sample
//
//  Created by Vibhanshu Jain on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountDetailController:UIViewController, AccountDetailDelegate{

    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Details".uppercased()
        UINavigationBar.appearance().backgroundColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont.vryAvenirNextRegular(18), .foregroundColor: VCustomGrey.normal.color]
        UINavigationBar.appearance().titleTextAttributes = attributes

    }
    required init?(coder: NSCoder) { nil }
    
    
    
    //MARK: Overrides
    override func loadView() {
        view = customView
        
    }
    
    func setDataForCurrentScreen(item: ModalAccount){
        customView.lblAccountName.text = item.accountName
        customView.lblDesc.text = item.desc
        if(item.accountType == "card"){
            customView.imgDisplayType.image = UIImage(named: "card")
        }
        else{ //bank
            customView.imgDisplayType.image = UIImage(named: "bank")

        }

    }
    
    private lazy var customView: AccountDetailView = {
        //        return AccountListView(delegate: self)
       return AccountDetailView(delegate: self)
    }()
    

    
    func onClickDone() {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
