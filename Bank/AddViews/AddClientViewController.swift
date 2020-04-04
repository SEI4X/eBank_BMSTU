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
    var country = 0
    var date = String()
    var beer = 0
    private let firstNameTF = UITextField()
    private let secondNameTF = UITextField()
    private let ageLable = UILabel()
    private let ageTF = UITextField()
    private let countryLable = UILabel()
    private let countryPicker = UIPickerView()
    private let partyLable = UILabel()
    private let datePicker = UIDatePicker()
    private let favBeerLable = UILabel()
    private let favBeerPicker = UIPickerView()
    private let confirmButton = UIButton()
    private let mainLable: UILabel = {
        let text = UILabel()
        text.text = "Новый член партии"
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
        scrollViewSetup()
        countryLableSetup()
        buttonSetup()
        firstNamesSetup()
        secondNamesSetup()
        ageSetup()
        countryPickerSetup()
        datePickerSetup()
        favBeerPickerSetup()
        favBeerLableSetup()
        partyLableSetup()
    }
    
//MARK: - Names textFields setups
    func firstNamesSetup(){
        firstNameTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 60, width: tfWidth, height: tfHeight)
        firstNameTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        firstNameTF.layer.cornerRadius = 15
        firstNameTF.textAlignment = .center
        firstNameTF.placeholder = "Имя"
        
        scrollView.addSubview(firstNameTF)
    }
    
    func secondNamesSetup(){
        secondNameTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 110, width: tfWidth, height: tfHeight)
        secondNameTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        secondNameTF.layer.cornerRadius = 15
        secondNameTF.textAlignment = .center
        secondNameTF.placeholder = "Фамилия"
        
        scrollView.addSubview(secondNameTF)
    }
    
//MARK: - Age TF setup
    func ageSetup(){
        ageTF.frame = CGRect(x: view.bounds.midX - tfWidth / 2, y: 160, width: tfWidth, height: tfHeight)
        ageTF.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        ageTF.layer.cornerRadius = 15
        ageTF.textAlignment = .center
        ageTF.placeholder = "Возраст"
        
        scrollView.addSubview(ageTF)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//MARK: - Pickers setup
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPicker {
            return Countries.countries.count
        } else if pickerView == favBeerPicker{
   //       return RegData.beer.count
            return 0
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPicker {
            return Countries.countries[row]
        } else if pickerView == favBeerPicker{
   //         return RegData.beer[row]
            return "Error"
        } else {
            return "Error"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         if pickerView == countryPicker {
             country = row
         } else if pickerView == favBeerPicker{
             beer = row
         }
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
        
        scrollView.addSubview(countryPicker)
    }
    
    func countryLableSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 20
        countryLable.text = "Страна"
        countryLable.textColor = .lightGray
        countryLable.frame = CGRect(x: view.bounds.midX - width / 2, y: 220, width: width, height: height)
        countryLable.font = .systemFont(ofSize: 20)
        
        scrollView.addSubview(countryLable)
    }
    
//MARK: - Date Picker setup
    func datePickerSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 150
        let date = DateFormatter()
        date.dateFormat = "yyyy-mm-dd"

        datePicker.frame = CGRect(x: view.bounds.midX - width / 2, y: 450, width: width, height: height)
        datePicker.datePickerMode = .date
        datePicker.maximumDate = date.date(from: "2002-01-01")
        datePicker.minimumDate = date.date(from: "1930-01-01")
        datePicker.layer.cornerRadius = 15
        datePicker.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        scrollView.addSubview(datePicker)
    }
    
    func datePickerData(){
        let dateFormatter = DateFormatter()

//        dateFormatter.dateStyle = DateFormatter.Style.short   // You can also use Long, Medium and No style.
//        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy-MM-dd"

        date = dateFormatter.string(from: datePicker.date)
        print(date)
    }
    
    func partyLableSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 20
        partyLable.text = "Партия"
        partyLable.textColor = .lightGray
        partyLable.frame = CGRect(x: view.bounds.midX - width / 2, y: 420, width: width, height: height)
        partyLable.font = .systemFont(ofSize: 20)
        
        scrollView.addSubview(partyLable)
    }
    
//MARK: - Favourite beer Picker setup
    func favBeerPickerSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 150
        favBeerPicker.frame = CGRect(x: view.bounds.midX - width / 2, y: 650, width: width, height: height)
        favBeerPicker.delegate = self
        favBeerPicker.dataSource = self
        favBeerPicker.layer.cornerRadius = 15
        favBeerPicker.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        scrollView.addSubview(favBeerPicker)
    }
    
    func favBeerLableSetup(){
        let width: CGFloat = 300
        let height: CGFloat = 20
        favBeerLable.text = "Любимое пиво"
        favBeerLable.textColor = .lightGray
        favBeerLable.frame = CGRect(x: view.bounds.midX - width / 2, y: 620, width: width, height: height)
        favBeerLable.font = .systemFont(ofSize: 20)
        
        scrollView.addSubview(favBeerLable)
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
            && Int(ageTF.text!) != nil && country != 0{
            successAlert()
        } else {
            failAlert()
        }
    }
    
//MARK: - ScrollView setup
    func scrollViewSetup(){
        self.view.addSubview(scrollView)

        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -2).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2).isActive = true
        scrollView.contentSize = CGSize(width: scrollView.bounds.width - 2, height: 810)
    }
    
//MARK: - Alert setups
    func successAlert() {
       // Create the action buttons for the alert.
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.datePickerData()
            self.dismiss(animated: true, completion: nil)
       }
        
       // Create and configure the alert controller.
       let alert = UIAlertController(title: "Успешно",
             message: "Пользователь успешно добавлен",
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

