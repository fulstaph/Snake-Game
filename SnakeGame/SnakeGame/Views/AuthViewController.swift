//
//  AuthViewController.swift
//  SnakeGame
//
//  Created by Svetlana Timofeeva on 09/12/2019.
//  Copyright © 2019 jorge. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var loginTextField: UITextField!
    private var passwordTextField: UITextField!
    
    private var loginButton: UIButton!
    
    private var gradient: CAGradientLayer = {
        let grad = CAGradientLayer()
        grad.colors = [UIColor.white.cgColor, UIColor.green.cgColor]
        grad.locations = [0.0, 1.0]
        grad.startPoint = CGPoint(x: 0.5, y: 1.0)
        grad.endPoint = CGPoint(x: 0.5, y: 0.0)
        return grad
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Authorization"
        view.backgroundColor = .white
        print("auth")
       
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        loginTextField = UITextField(frame: .zero)
        loginTextField.borderStyle = .roundedRect
        loginTextField.textAlignment = .left
        loginTextField.autocapitalizationType = .none
        loginTextField.placeholder = "Enter login:"
        loginTextField.clearsOnBeginEditing = true
        loginTextField.tintColor = .black
        view.addSubview(loginTextField)
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textAlignment = .left
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Enter password:"
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.tintColor = .black
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Log in!", for: .normal)
        loginButton.backgroundColor = .green
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        loginButton.layer.shadowOpacity = 1.0
        loginButton.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTextField.widthAnchor.constraint(equalToConstant: 150),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            //button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 16/9),
            loginTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.widthAnchor.constraint(equalToConstant: 150),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            //button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 16/9),
            passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 168)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 30),
            //button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 16/9),
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100)
        ])
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func onLoginButtonTapped() {
        AppDelegate.shared.logged = true
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }
    
}