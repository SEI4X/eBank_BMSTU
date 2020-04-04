//
//  RegisterViewController.swift
//  Bank
//
//  Created by Alexei Mashkov on 20.03.2020.
//  Copyright © 2020 Alexei Mashkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Creating items
        var restoreButton = UIButton()
        var loginButton = UIButton()
        var registerButton = UIButton()
        var loginTextField = UITextField()
        var passwordTextField = UITextField()

        let bgColor2 = CGColor(srgbRed: 25/256, green: 25/256, blue: 25/256, alpha: 1)
        let bgColor1 = CGColor(srgbRed: 43/256, green: 43/256, blue: 43/256, alpha: 1)
        
        let buttonColor1 = CGColor(srgbRed: 0.1328, green: 0.85932, blue: 0.988218, alpha: 1)
        let buttonColor2 = CGColor(srgbRed: 0.1094, green: 0.5664, blue: 0.8828, alpha: 1)
        let buttonColor3 = CGColor(srgbRed: 0.34373, green: 0.3945, blue: 0.7230, alpha: 1)
        
        //let mainColor = UIColor(red: 0.9961, green: 0.3867, blue: 0.21875, alpha: 1)      //orange
        let mainColor = UIColor(red: 0.1055, green: 0.5625, blue: 0.99603, alpha: 1)        //blue
        private enum typeOfItems {
            case login
            case register
        }
        
        //This structure for replacing Anchor
        //it will make position and animation things more simple
        private struct screen{
            static let sectionY = UIScreen.main.bounds.height / 100
            static let sectionX = UIScreen.main.bounds.width / 100
        }
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackground()
        self.setupImg()
        self.setupRegisterLable()
        
        loginTextField = setupTextFields(type: typeOfItems.login)
        passwordTextField = setupTextFields(type: typeOfItems.register)
        
        loginButton = setupLoginButton()
        loginButton.addTarget(self, action: #selector(loginButtonTouchUpInside), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTouchDown), for: .touchDown)
        loginButton.addTarget(self, action: #selector(loginButtonTouchUpOutside), for: .touchUpOutside)
        
        registerButton = setupRegisterButton()
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        
        restoreButton = setupRestoreButton()
        restoreButton.addTarget(self, action: #selector(restoreButtonClicked), for: .touchUpInside)
        
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(restoreButton)
        
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }

        
    //MARK: Textfields add
        private func setupTextFields(type: typeOfItems) -> UITextField{ //name - is a type of textfield (login / password)
            let tf = UITextField()
            tf.layer.cornerRadius = 20
            tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            tf.layer.borderWidth = 1
            tf.layer.borderColor = UIColor.white.cgColor
            tf.textColor = .white
            tf.textAlignment = .center
            
            if type == .login {
                tf.placeholder = "Your Email"
                setupPosition(tf: tf, pos: screen.sectionY * 28)       //28 - 28 section on Y
            } else {
                tf.placeholder = "Password"
                tf.isSecureTextEntry = true
                setupPosition(tf: tf, pos: screen.sectionY * 35)       //35 section on Y
            }
            
            
            return tf
        }
        
    //MARK: - Background setup
        private func setupBackground(){
            let layer = CAGradientLayer()
            layer.frame = view.bounds
            layer.colors = [bgColor1, bgColor2]
            view.layer.addSublayer(layer)
        }
        
    //MARK: - Login buttons setup
        private func setupLoginButton() -> UIButton {
            let button = UIButton()
            
            let bgLayer = CAGradientLayer()
            
            button.layer.cornerRadius = 20
            button.setTitle("Sign in", for: .normal)
            button.setTitleColor(.white, for: .normal)
            setupPosition(tf: button, pos: screen.sectionY * 42)
            
            bgLayer.frame = CGRect(x: 0, y: 0, width: button.frame.width, height: button.frame.height)
            bgLayer.cornerRadius = 20
            bgLayer.colors = [buttonColor1, buttonColor2, buttonColor3]
            bgLayer.startPoint = CGPoint(x: 0, y: 0.5)
            bgLayer.endPoint = CGPoint(x: 1, y: 0.5)
            button.layer.addSublayer(bgLayer)
            
            return button
        }
        
    //MARK: - Logo setup
        private func setupImg(){
            let img = UIImageView()
          //  img.image = UIImage(imageLiteralResourceName: "Logo")
            img.frame = CGRect(x: view.center.x - screen.sectionY * 13,
                               y: screen.sectionY * 10,
                               width: screen.sectionY * 26,
                               height: screen.sectionY * 13)
            view.addSubview(img)
            
        }
        
    //MARK: - Register buttons setup
        private func setupRegisterButton() -> UIButton {
            let button = UIButton()
            button.setTitle("Sign up", for: .normal)
            button.setTitleColor(mainColor, for: .normal)
            button.frame = CGRect(x: screen.sectionX * 30,
                                  y: screen.sectionY * 88,
                                  width: screen.sectionX * 40,
                                  height: 40)
                   
            return button
        }
        
    //MARK: - Restore buttons setup
        private func setupRestoreButton() -> UIButton {
            let button = UIButton()
            button.setTitle("Forgot Password?", for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.gray, for: .selected)
            button.frame = CGRect(x: screen.sectionX * 20,
            y: screen.sectionY * 48,
            width: screen.sectionX * 60,
            height: 40)
                   
            return button
        }
        
    //MARK: - Login button click
        
        @objc func loginButtonTouchUpInside(){
            print("Login button clicked")
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
            if (true) {
                self.dismiss(animated: true, completion: nil)
            }
            UIView.animate(withDuration: 0.1, animations: {
                self.loginButton.transform = CGAffineTransform.identity
            })
            
        }
        
        @objc func loginButtonTouchUpOutside(){
            UIView.animate(withDuration: 0.1, animations: {
                self.loginButton.transform = CGAffineTransform.identity
            })
        }
        
        @objc func loginButtonTouchDown(){
            UIView.animate(withDuration: 0.1, animations: {
                self.loginButton.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
            })
        }

    //MARK: - Register buttons setup
        @objc func registerButtonClicked(){
            print("Register button clicked")
        }
        
    //MARK: - Restore buttons setup
        @objc func restoreButtonClicked(){
            print("Restore button clicked")

        }
        
    //MARK: - Position func
        //setting up buttons' and textFields' positions on screen
        private func setupPosition(tf: UIView, pos : CGFloat){
            tf.frame = CGRect(x: screen.sectionX * 6,
                              y: pos,
                              width: screen.sectionX * 88,
                              height: 40)
        }
        
    //MARK: - Lable setup
        private func setupRegisterLable(){
            let lable = UILabel()
            lable.text = "Don't have an account yet?"
            lable.textColor = .white
            lable.textAlignment = .center
            setupPosition(tf: lable, pos: screen.sectionY * 84)
                           
            view.addSubview(lable)
        }

    //MARK: - Check Login
        func checkLogin(login : String, password: String) -> Bool{
            return false
        }
        
    //MARK: - Dismiss keyboard
    @objc override func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }

}
