//
//  ClientsCell.swift
//  Bank
//
//  Created by Alexei Mashkov on 03.04.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class ClientsCell: UITableViewCell {

    var clientsInfo : ClientsInfo? {
        didSet {
            nameLable.text = (clientsInfo?.firstName ?? "Error") + " " + (clientsInfo?.secondName ?? "")
            passportLable.text = "Паспорт: \(clientsInfo?.passport ?? "Error")"
            ageLable.text = "Возраст: \(clientsInfo?.age ?? 0)"
            countryLable.text = "Страна: \(clientsInfo?.country ?? "Error")"
            statusLable.text = clientsInfo?.status ?? "Error"
            isCurrentLable.text = clientsInfo?.isCurrent == true ? "Активный" : "Не активный"
            if clientsInfo?.isCurrent == true {
                isCurrentLable.textColor = .green
            } else {
                isCurrentLable.textColor = .red
            }
        }
    }
    
    private let nameLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let passportLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = .systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let ageLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let countryLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let statusLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let isCurrentLable : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .green
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLable)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        nameLable.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        
        let leftStuck = UIStackView(arrangedSubviews: [statusLable, ageLable, countryLable])
        leftStuck.distribution = .equalSpacing
        leftStuck.axis = .vertical
        leftStuck.spacing = 1
        addSubview(leftStuck)
        
        leftStuck.translatesAutoresizingMaskIntoConstraints = false
        leftStuck.topAnchor.constraint(equalTo: nameLable.bottomAnchor).isActive = true
        leftStuck.widthAnchor.constraint(equalToConstant: 150).isActive = true
        leftStuck.heightAnchor.constraint(equalToConstant: 60).isActive = true
        leftStuck.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
//        let rightStuck = UIStackView(arrangedSubviews: [drunkLable, donateLable, favLable])
//        rightStuck.distribution = .equalSpacing
//        rightStuck.axis = .vertical
//        leftStuck.spacing = 2
//        addSubview(rightStuck)
//        
//        rightStuck.translatesAutoresizingMaskIntoConstraints = false
//        rightStuck.topAnchor.constraint(equalTo: nameLable.bottomAnchor).isActive = true
//        rightStuck.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        rightStuck.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        rightStuck.leftAnchor.constraint(equalTo: leftStuck.rightAnchor).isActive = true
//        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
