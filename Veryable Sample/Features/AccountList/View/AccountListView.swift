//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit



class AccountListView: UIView {
    
    //MARK: Public API
    
    //MARK: Inits
    
    init(withTableViewDelegate tblDelegate: UITableViewDelegate , withTableViewDatasource tblDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.tblDel = tblDelegate
        self.tblDataSource = tblDataSource
        setup()
    }
    required init?(coder: NSCoder) { nil }
    
    //MARK: setup
    
    private func setup() {
        backgroundColor = .white
        constrain()
    }
    
    private func constrain() {
        
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        tblList.snp.makeConstraints {
            $0.bottom.equalTo(0).offset(-bottomPadding)
            $0.width.equalTo(self)
            $0.top.equalTo(self).offset(topPadding)
        }
    }
    
    //MARK: Overrides
    
    //MARK: Private members
    private weak var tblDel: UITableViewDelegate?
    private weak var tblDataSource: UITableViewDataSource?
    
    //MARK: Lazy Loads
    
    private lazy var tblList: UITableView = {
        
        let tbl = UITableView()
        tbl.delegate = self.tblDel
        tbl.dataSource = self.tblDataSource
        tbl.clipsToBounds = true
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(AccountListTableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.register(AccountListTableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tbl.rowHeight = 100
        tbl.separatorStyle = .singleLine
        if #available(iOS 15.0, *) {
            tbl.sectionHeaderTopPadding = 0
        }
        addSubview(tbl)
        return tbl
        
    }()
    
    //MARK: Notification to reload data
    func reloadTableOnDataRefresh(){
        removeLoadingScreen()
        tblList.reloadData()
    }
    
    func showLoadingScreen(){
        //UI Not provided
    }
    
    func removeLoadingScreen(){
        //UI Not provided
    }
}
