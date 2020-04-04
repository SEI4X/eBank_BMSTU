//
//  BranchesController.swift
//  Bank
//
//  Created by Alexei Mashkov on 20.03.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class BranchesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Items
    //    private var members : [MembersInfo] = [MembersInfo]()
        private let navLable: UILabel = {
            let lable = UILabel()
            lable.text = "Отделения"
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
        
    //MARK: - Deleting cell request
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
            print("Deleted")
            agreeToTerms(indexPath: indexPath)
          }
        }

    //MARK: - Cell action setup
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            myTableView.deselectRow(at: indexPath, animated: true)
        }
        
    //MARK: - Allert to confirm deleting
        func agreeToTerms(indexPath: IndexPath) {
            
            let defaultAction = UIAlertAction(title: "Удалить", style: .default) { (action) in
    //            self.members.remove(at: indexPath.row)
     //           self.addData()
     //           self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
           let cancelAction = UIAlertAction(title: "Отменить", style: .cancel) { (action) in
            // Respond to user selection of the action.
           }
           
           // Create and configure the alert controller.
           let alert = UIAlertController(title: "Удаление члена партии",
                 message: "Вы уверены, что хотите удалить члена партии? Данное изменение нельзя будет отменить.",
                 preferredStyle: .alert)
           alert.addAction(defaultAction)
           alert.addAction(cancelAction)
                
           self.present(alert, animated: true) {
              // The alert was presented
           }
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
