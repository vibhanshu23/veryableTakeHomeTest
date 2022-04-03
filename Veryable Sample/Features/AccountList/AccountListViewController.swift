//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //MARK: Public API
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        
        UINavigationBar.appearance().backgroundColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont.vryAvenirNextRegular(18), .foregroundColor: VCustomGrey.normal.color]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    required init?(coder: NSCoder) { nil }
    
    
    
    //MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        self.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableOnDataRefresh), name: Notification.Name("Data Refreshed"), object: nil)
        self.title = "Accounts".uppercased()
    }
    
    
    //MARK: Private members
    
    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        let accountLstVw = AccountListView(withTableViewDelegate: self, withTableViewDatasource: self)
        if(!AccountModalDataHandler.shared.isInitialized){
            accountLstVw.showLoadingScreen()
        }
        return accountLstVw
    }()
    
    
    //MARK: Delegate functions
    
    @objc func reloadTableOnDataRefresh(){
        
        customView.reloadTableOnDataRefresh()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        AccountModalDataHandler.shared.getData().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AccountModalDataHandler.shared.getData()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AccountListTableViewCell
        
        let element = AccountModalDataHandler.shared.getData()[indexPath.section][indexPath.row]
        
        cell.lblAccountName.text = element.accountName
        cell.lblDesc.text = element.desc
        if(element.accountType == "card"){
            cell.lblTertiary.text = "Card: Instant"
            cell.imgDisplayType.image = UIImage(named: "card")
        }
        else{ //bank
            cell.lblTertiary.text = "Bank Account: ACH - Same Day"
            cell.imgDisplayType.image = UIImage(named: "bank")
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let accountDetailVC = AccountDetailController()
        self.navigationController?.pushViewController(accountDetailVC, animated: true)
        
        accountDetailVC.setDataForCurrentScreen(item: AccountModalDataHandler.shared.getData()[indexPath.section][indexPath.row]) //change to id
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! AccountListTableHeader
        if((section) == 0){
            header.lblHeader.text = "Bank Accounts"
        }
        else{
            header.lblHeader.text = "Cards"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        48
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}


