//
//  LoginVC.swift
//  FaceBookClone
//
//  Created by Yiding He on 7/31/19.
//  Copyright © 2019 Yiding He. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var textFieldsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure_textFieldsView()
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
}
