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
    
    
    //MARK: Init
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Setup code for Detail
    func setDataForCurrentScreen(item: AccountModal){
        customView.lblAccountName.text = item.accountName
        customView.lblDesc.text = item.desc
        if(item.accountType == "card"){
            customView.imgDisplayType.image = UIImage(named: "card")
        }
        else{ //bank
            customView.imgDisplayType.image = UIImage(named: "bank")
            
        }
        
    }
    
    //MARK: Lazy Loads
    
    private lazy var customView: AccountDetailView = {
        return AccountDetailView(delegate: self)
    }()
    
    
    //MARK: Button actions delegate
    
    func onClickDone() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
