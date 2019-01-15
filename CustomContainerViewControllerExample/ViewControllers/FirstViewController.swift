//
//  FirstViewController.swift
//  CustomContainerViewControllerExample
//
//  Created by Mohamed Abdul-Hameed on 1/15/19.
//  Copyright © 2019 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "1st VC Text Field..."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAndConfigureSubviews()
        print("FirstViewController didLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstViewController willAppear")
    }
    
    private func addAndConfigureSubviews() {
        addAndConfigureTextField()
    }
    
    private func addAndConfigureTextField() {
        view.addSubview(textField)
        setupTextFieldConstraints()
    }
    
    private func setupTextFieldConstraints() {
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
