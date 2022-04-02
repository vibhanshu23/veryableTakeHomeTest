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
        self.del = delegate
        self.tblDel = tblDelegate
        self.tblDataSource = tblDataSource
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color
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
        tblList.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(self)
            $0.width.equalTo(self)
            $0.top.equalTo(self)

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
        
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(AccountListTableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.rowHeight = 200
        tbl.layer.backgroundColor = UIColor.blue.cgColor
        
        
        addSubview(tbl)
        return tbl
        
    }()
    
}
