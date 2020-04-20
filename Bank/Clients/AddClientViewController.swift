//
//  AddClientsViewController.swift
//  Bank
//
//  Created by Alexei Mashkov on 04.04.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class AddClientViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

//MARK: - Items initial
    static var firstName = String()
    static var secondName = String()
    static var date = String()
    static var passport = String()
    static var country = String()
    static var message = String()
    private let firstNameTF = UITextField()
    private let secondNameTF = UITextField()
    private let passportTF = UITextField()
    private let countryLable = UILabel()
    private let countryPicker = UIPickerView()
    private let dateLable = UILabel()
    private let datePicker = UIDatePicker()
    private let confirmButton = UIButton()
    private let mainLable: UILabel = {
        let text = UILabel()
        text.text = "Новый клиент"
        text.textColor = .lightGray
        text.textAlignment = .center
        text.frame = CGRect(x: 10, y: 10, width: 280, height: 40)
        return text
    }()
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        return v
    }()
    
    let tfWidth: CGFloat = 300
    let tfHeight: CGFloat = 40
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        
        self.hideKeyboardWhenTappedAround()
        view.addSubview(mainLable)
//        scrollViewSetup()
        countryLableSetup()
        buttonSetup()
        firstNamesSetup()
        secondNamesSetup()
        passportSetup()
        countryPickerSetup()
        datePickerSetup()
        dateLableSetup()
    }
    
//MARK: - Names textFields setups
    func firstNamesSetup(){
        firstNameTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 60, width: tfWidth, height: tfHeight)
        firstNameTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        firstNameTF.layer.cornerRadius = 15
        firstNameTF.textAlignment = .center
        firstNameTF.placeholder = "Имя"
        
        view.addSubview(firstNameTF)
    }
    
    func secondNamesSetup(){
        secondNameTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 110, width: tfWidth, height: tfHeight)
        secondNameTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        secondNameTF.layer.cornerRadius = 15
        secondNameTF.textAlignment = .center
        secondNameTF.placeholder = "Фамилия"
        
        view.addSubview(secondNameTF)
    }
    
//MARK: - Age TF setup
    func passportSetup(){
        passportTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 160, width: tfWidth, height: tfHeight)
        passportTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        passportTF.layer.cornerRadius = 15
        passportTF.textAlignment = .center
        passportTF.placeholder = "Номер паспорта"
        
        view.addSubview(passportTF)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//MARK: - Pickers setup
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return Countries.countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return Countries.countries[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        AddClientViewController.country = Countries.countries[row]
    }
    
    
//MARK: - Country Picker setup
    func countryPickerSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 150
        countryPicker.frame = CGRect(x: view.bounds.midX - width / 2, y: 250, width: width, height: height)
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryPicker.layer.cornerRadius = 15
        countryPicker.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        view.addSubview(countryPicker)
    }
    
    func countryLableSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 20
        countryLable.text = "Гражданство"
        countryLable.textColor = .lightGray
        countryLable.frame = CGRect(x: view.bounds.midX - width / 2, y: 220, width: width, height: height)
        countryLable.font = .systemFont(ofSize: 20)
        
        view.addSubview(countryLable)
    }
    
//MARK: - Date Picker setup
    func datePickerSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 220
        let date = DateFormatter()
        date.dateFormat = "yyyy-mm-dd"

        datePicker.frame = CGRect(x: view.bounds.midX - width / 2, y: 450, width: width, height: height)
        datePicker.datePickerMode = .date
        datePicker.maximumDate = date.date(from: "2002-01-01")
        datePicker.minimumDate = date.date(from: "1930-01-01")
        datePicker.layer.cornerRadius = 15
        datePicker.layer.masksToBounds = true
        datePicker.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        view.addSubview(datePicker)
    }
    
    func datePickerData()-> String? {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.short   // You can also use Long, Medium and No style.
//        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: datePicker.date)
    }
    
    func dateLableSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 20
        dateLable.text = "Год рождения"
        dateLable.textColor = .lightGray
        dateLable.frame = CGRect(x: view.bounds.midX - width / 2, y: 420, width: width, height: height)
        dateLable.font = .systemFont(ofSize: 20)
        
        view.addSubview(dateLable)
    }
    
    
//MARK: - Confirm button setup
    func buttonSetup(){
        let vcWidth: CGFloat = self.view.bounds.width
        confirmButton.frame = CGRect(x: vcWidth - 110, y: 10, width: 100, height: 40)
        confirmButton.setTitle("Добавить", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        
        view.addSubview(confirmButton)
    }
    
    @objc func buttonTouch(){
        if firstNameTF.text != "" && secondNameTF.text != ""
            && Int(passportTF.text!) != nil && AddClientViewController.country != "" &&
            datePickerData() != "" {
            AddClientViewController.firstName = self.firstNameTF.text!
            AddClientViewController.secondName = self.secondNameTF.text!
            AddClientViewController.date = self.datePickerData()!
            AddClientViewController.passport = self.passportTF.text!
            
            AddClient().addClient()
            
            successAlert(message: AddClientViewController.message)
        } else {
            failAlert()
        }
    }
    
//MARK: - ScrollView setup
//    func scrollViewSetup(){
//        self.view.addSubview(scrollView)
//
//        // constrain the scroll view to 8-pts on each side
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -2).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2).isActive = true
//        scrollView.contentSize = CGSize(width: scrollView.bounds.width - 2, height: 810)
//    }
    
//MARK: - Alert setups
    func successAlert(message: String) {
       // Create the action buttons for the alert.
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            self.dismiss(animated: true, completion: nil)
       }
        
       // Create and configure the alert controller.
       let alert = UIAlertController(title: "Успешно",
                                     message: "Пользователь создан успешно",
             preferredStyle: .alert)
       alert.addAction(okAction)
            
       self.present(alert, animated: true) {
          // The alert was presented
       }
    }
    
    func failAlert() {
       // Create the action buttons for the alert.
       let okAction = UIAlertAction(title: "Назад", style: .default) { (action) in

       }
       
       // Create and configure the alert controller.
       let alert = UIAlertController(title: "Неудача",
             message: "Пользователь не был добавлен. Повторите попытку",
             preferredStyle: .alert)
       alert.addAction(okAction)
            
       self.present(alert, animated: true) {
          // The alert was presented
       }
    }
}


//MARK: - UIViewController keyboard extension
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

