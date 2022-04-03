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

protocol AccountListDelegate: AnyObject {
    
    func getData() -> String
    
}

class AccountListView: UIView {

    //MARK: Public API

    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    init(delegate: AccountListDelegate, withTableViewDelegate tblDelegate: UITableViewDelegate , withTableViewDatasource tblDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.del = delegate
        self.tblDel = tblDelegate
        self.tblDataSource = tblDataSource
        setup()
    }
    required init?(coder: NSCoder) { nil }



    
    private func setup() {
        backgroundColor = .white//ViewColor.background.color
//        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableOnDataRefresh), name: Notification.Name("Data Refreshed"), object: nil)
        
        constrain()
    }

    func reloadTableOnDataRefresh(){
        
        print("did recieve notification")
        tblList.reloadData()
        
    }
    
    private func constrain() {
        helloLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
        

        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        tblList.snp.makeConstraints {
            $0.bottom.equalTo(0).offset(-bottomPadding)
            $0.width.equalTo(self)
            $0.top.equalTo(self).offset(topPadding)//statusBarFrame?.height as! ConstraintRelatableTarget)
//            $0.top.equalTo(statusBarFrame?.height)

        }
        
       

                   
        
    }

    //MARK: Overrides

    //MARK: Private members
    private weak var del: AccountListDelegate?
    private weak var tblDel: UITableViewDelegate?
    private weak var tblDataSource: UITableViewDataSource?

    //MARK: Lazy Loads
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = del?.getData()//"Hello, World!"
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()
    
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
        } else {
            // Fallback on earlier versions
        }
        
        
        addSubview(tbl)
        return tbl
        
    }()
    
    
}
