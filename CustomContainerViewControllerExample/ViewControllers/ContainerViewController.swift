//
//  ContainerViewController.swift
//  CustomContainerViewControllerExample
//
//  Created by Mohamed Abdul-Hameed on 1/15/19.
//  Copyright © 2019 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    private lazy var firstViewController: FirstViewController = {
        return FirstViewController()
    }()
    
    private lazy var secondViewController: SecondViewController = {
        return SecondViewController()
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["iOS" , "Android"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addAndConfigureSubviews()
        configureContainerView()
    }
    
    @objc private func indexChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            addContentViewController(firstViewController)
            removeContentViewController(secondViewController)
        } else if sender.selectedSegmentIndex == 1 {
            addContentViewController(secondViewController)
            removeContentViewController(firstViewController)
        }
    }
    
    private func configureContainerView() {
        addContentViewController(firstViewController)
    }
    
    private func addContentViewController(_ viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        viewController.didMove(toParent: self)
    }
    
    private func removeContentViewController(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func addAndConfigureSubviews() {
        addAndConfigureSegmentedControl()
    }
    
    private func addAndConfigureSegmentedControl() {
        view.addSubview(segmentedControl)
        setupSegmentedControlConstraints()
    }
    
    private func setupSegmentedControlConstraints() {
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 250).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
    }
}

