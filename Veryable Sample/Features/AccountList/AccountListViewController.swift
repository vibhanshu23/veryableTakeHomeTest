//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController {
    //MARK: Public API

    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }

    var variable1 = ""
    
    //MARK: Overrides
    override func loadView() {
        view = customView
    }

    //MARK: Private members

    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        return AccountListView(delegate: self)
//        AccountListView(delegate: self, withTableViewDelegate: self, withTableViewDatasource: self)
    }()
    
    
}

extension AccountListViewController: AccountListDelegate {
    func getData() -> String {
        return "data"
    }
    

}
extension AccountListViewController: UITableViewDelegate {
    

}
extension AccountListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    

}

