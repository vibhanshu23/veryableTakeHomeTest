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
        self.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }
    
    
    
    //MARK: Overrides
    override func loadView() {
        view = customView
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableOnDataRefresh), name: Notification.Name("Data Refreshed"), object: nil)
        
    }
    
    
    
    @objc func reloadTableOnDataRefresh(){
        
        customView.reloadTableOnDataRefresh()
        
    }
    
    
    
    //MARK: Private members
    
    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        //        return AccountListView(delegate: self)
        AccountListView(delegate: self, withTableViewDelegate: self, withTableViewDatasource: self)
    }()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        AccountListModal.shared.getData().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AccountListModal.shared.getData()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AccountListTableViewCell
        
        let element = AccountListModal.shared.getData()[indexPath.section][indexPath.row]
        
        cell.lblAccountName.text = element.accountName
        cell.lblDesc.text = element.desc
        if(element.accountType == "card"){
            cell.lblTertiary.text = "Bank Account: ACH - Same Day"
        }
        else{
            cell.lblTertiary.text = "Card: Instant"

        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        
        
    }
    
    
    
    
    
    
    
}

extension AccountListViewController: AccountListDelegate {
    func getData() -> String {
        return "data"
    }
    
    
}
