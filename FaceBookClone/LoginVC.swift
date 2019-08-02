//
//  LoginVC.swift
//  FaceBookClone
//
//  Created by Yiding He on 7/31/19.
//  Copyright © 2019 Yiding He. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var textFieldsView: UIView!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var leftLineView: UIView!
    @IBOutlet var rightLineView: UIView!
    
    @IBOutlet var handsImageView: UIImageView!
    
    @IBOutlet var coverImageView_top: NSLayoutConstraint!
    @IBOutlet var whiteIconImageView_y: NSLayoutConstraint!
    @IBOutlet var handsImageView_top: NSLayoutConstraint!
    @IBOutlet weak var registerButton_bottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(false)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        print("keyboardWillShow")
        coverImageView_top.constant -= 75
        handsImageView_top.constant -= 75
        whiteIconImageView_y.constant += 50
        
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            registerButton_bottom.constant += keyBoardSize.height
        }
        
        UIView.animate(withDuration: 0.8) {
            self.handsImageView.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        print("keyboardWillHide")
        coverImageView_top.constant += 75
        handsImageView_top.constant += 75
        whiteIconImageView_y.constant -= 50
        
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            registerButton_bottom.constant -= keyBoardSize.height
        }
        
        UIView.animate(withDuration: 0.8) {
            self.handsImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure_registerBtn()
        configure_textFieldsView()
        configure_loginBtn()
        configure_orLabel()
    }
    
    func configure_textFieldsView() {
        let border = CALayer()
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        border.borderColor = color
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: 0, width: textFieldsView.frame.width, height: textFieldsView.frame.height)
        
        let line = CALayer()
        line.borderWidth = width
        line.borderColor = color
        line.frame = CGRect(x: 0, y: textFieldsView.frame.height / 2 - width, width: textFieldsView.frame.width, height: width)
        
        textFieldsView.layer.addSublayer(border)
        textFieldsView.layer.addSublayer(line)
        
        textFieldsView.layer.cornerRadius = 5
        textFieldsView.layer.masksToBounds = true
    }
    
    func configure_loginBtn() {
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        loginButton.isEnabled = false
    }
    
    func configure_orLabel() {
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        let leftLine = CALayer()
        leftLine.borderWidth = width
        leftLine.borderColor = color
        leftLine.frame = CGRect(x: 0, y: leftLineView.frame.height / 2 - width, width: leftLineView.frame.width, height: width)
        
        let rightLine = CALayer()
        rightLine.borderWidth = width
        rightLine.borderColor = color
        rightLine.frame = CGRect(x: 0, y: rightLineView.frame.height / 2 - width, width: rightLineView.frame.width, height: width)
        
        leftLineView.layer.addSublayer(leftLine)
        rightLineView.layer.addSublayer(rightLine)
    }
    
    func configure_registerBtn() {
        let border = CALayer()
        border.borderColor = UIColor(red: 68 / 255, green: 105 / 255, blue: 176 / 255, alpha: 1).cgColor
        border.borderWidth = 2
        border.frame = CGRect(x: 0, y: 0, width: registerButton.frame.width, height: registerButton.frame.height)
        
        registerButton.layer.addSublayer(border)
        
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
    }
}
