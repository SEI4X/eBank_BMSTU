//
//  ViewController.swift
//  Bank
//
//  Created by Alexei Mashkov on 20.03.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTableView = UITableView()
    private let cellIdentifire = "Cell"
    private let cells = ["Транзакции", "Счета", "Кредиты", "Клиенты",
                         "Сотрудники", "Отделения", "Банкоматы"]
    
    private var tapCellIndex = 0
    let bgColor2 = CGColor(srgbRed: 25/256, green: 25/256, blue: 25/256, alpha: 1)
    let bgColor1 = CGColor(srgbRed: 43/256, green: 43/256, blue: 43/256, alpha: 1)
    let lableColor = CGColor(srgbRed: 0.1328, green: 0.85932, blue: 0.988218, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(cgColor: bgColor2)
        createTable()
    }

    //MARK: - Header setup
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let header = UILabel()
        view.backgroundColor = UIColor(cgColor: bgColor1)
        header.frame = CGRect(x: 0, y: 60, width: self.view.bounds.width, height: 30)
        header.text = "Банк \"eBank\""
        header.textColor = UIColor(cgColor: lableColor)
        header.backgroundColor = UIColor(cgColor: bgColor1)
        header.font = UIFont.boldSystemFont(ofSize: 24)
        header.adjustsFontSizeToFitWidth = true
        header.textAlignment = .center
        view.addSubview(header)
        let border = UIView(frame: CGRect(x: 0,y: 118,width: self.view.bounds.width,height: 2))
        border.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        view.addSubview(border)
        
        return view
    }
    
//MARK: - Sections setup
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
//MARK: - Cells setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        cell.backgroundColor = UIColor(cgColor: bgColor2)
        cell.textLabel?.text = cells[indexPath.row]
        cell.textLabel?.sizeToFit()
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
//MARK: - Cells actions setup
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            handlePresentingVC(TransactionsController())
            break
        case 1:
            handlePresentingVC(AccountsController())
            break
        case 2:
            handlePresentingVC(LoansController())
            break
        case 3:
            handlePresentingVC(ClientsController())
            break
        case 4:
            handlePresentingVC(EmployeesController())
            break
        case 5:
            handlePresentingVC(BranchesController())
            break
        case 6:
            handlePresentingVC(ATMsController())
            break
        default:
            break
        }
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
//MARK: - Table setup
    func createTable(){
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        self.myTableView.backgroundColor = UIColor(cgColor: bgColor2)
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.tableFooterView = UIView()
        myTableView.rowHeight = 80
        myTableView.sectionHeaderHeight = 120
        if #available(iOS 11.0, *) {
            self.myTableView.insetsContentViewsToSafeArea = false;
            self.myTableView.contentInsetAdjustmentBehavior = .never;
        }
        
        self.view.addSubview(myTableView)
    }

//MARK: - Present function
    func handlePresentingVC(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
//MARK: - Login View Present
    override func viewDidAppear(_ animated: Bool) {
        if !Defaults().isLoggedIn! {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }

}

