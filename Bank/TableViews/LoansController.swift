//
//  LoansController.swift
//  Bank
//
//  Created by Alexei Mashkov on 20.03.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class LoansController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Items
    //    private var members : [MembersInfo] = [MembersInfo]()
        private let navLable: UILabel = {
            let lable = UILabel()
            lable.text = "Кредиты"
            lable.textAlignment = .center
            lable.textColor = .darkGray
            lable.font = .systemFont(ofSize: 18)
            return lable
        }()
        private var refresher = UIRefreshControl()
        private var myTableView = UITableView()
        private let cellIdentifire = "Cell"
        private let addButton = UIBarButtonItem()
        let myAddButton = UIBarButtonItem(image: UIImage(named: "add"),
                                           style: .plain ,
                                           target: self , action: #selector(addButtonClick))
        
    //MARK: - viewDidLoad
        override func viewDidLoad() {
            super.viewDidLoad()
            
            addData()
            setupNavBar()
            createTable()
            refreshSetup()
        }
        
    //MARK: - Count of rows
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10000
        }
        
    //MARK: - Cell setup
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
    //        cell.membersInfo = members[indexPath.row]
            return cell
        }

    //MARK: - Table creating
        func createTable(){
            self.myTableView = UITableView(frame: view.bounds, style: .plain)
            self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            self.myTableView.tableFooterView = UIView()
            myTableView.rowHeight = 85
            
            self.view.addSubview(myTableView)
        }

    //MARK: - Cell action setup
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            myTableView.deselectRow(at: indexPath, animated: true)
        }
        
    //MARK: - NavigationBar setup
        func setupNavBar(){
            addButtonSetup()
            self.navigationItem.rightBarButtonItem = myAddButton
            self.navigationController!.navigationItem.setLeftBarButton(myAddButton, animated: true)
            self.navigationItem.titleView = navLable
            self.navigationController!.navigationItem.titleView = navLable
            
        }
        
    //MARK: - addButton setup
        @objc func addButtonClick(){
    //        let vc = AddMembersViewController()
    //        present(vc, animated: true, completion: nil)
        }
        
        private func addButtonSetup(){
    //        myAddButton.action = #selector(addButtonClick)
            myAddButton.target = self
        }

    //MARK: - Refresh controller setup
        func refreshSetup(){
            refresher.attributedTitle = NSAttributedString(string: "Потяните, чтобы обновить")
            refresher.addTarget(self, action: #selector(refreshing), for: .valueChanged)
            
            myTableView.addSubview(refresher)
        }
        
        @objc func refreshing(){
    //        members.removeAll()
            loadData()
            refresher.endRefreshing()
            myTableView.reloadData()
        }
        
        private func addData(){

        }
        //MARK: - test data add
        private func loadData(){

        }

}
