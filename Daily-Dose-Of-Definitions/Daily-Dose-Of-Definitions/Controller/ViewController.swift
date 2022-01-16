//
//  ViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView = MainView()
    let randomWordViewcontroller = RandomWordViewController()
    let searchDefinitionsViewController = SearchDefinitionsViewController()
    
    //MARK: - Initializers
    
    override func loadView() {
        view = contentView
        
        randomWordViewcontroller.view.translatesAutoresizingMaskIntoConstraints = false
        searchDefinitionsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(randomWordViewcontroller)
        addChild(searchDefinitionsViewController)
        
        contentView.randomWordView.addSubview(randomWordViewcontroller.view)
        contentView.searchDefinitionView.addSubview(searchDefinitionsViewController.view)
        
        randomWordViewcontroller.didMove(toParent: self)
        searchDefinitionsViewController.didMove(toParent: self)
        
        setUpUI()
    }

    //MARK: - UI Setup

    private func setUpUI() {
        view.backgroundColor = UIColor(named: "DarkGray")
    
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            randomWordViewcontroller.view.topAnchor.constraint(equalTo: contentView.randomWordView.topAnchor),
            randomWordViewcontroller.view.leadingAnchor.constraint(equalTo: contentView.randomWordView.leadingAnchor),
            randomWordViewcontroller.view.trailingAnchor.constraint(equalTo: contentView.randomWordView.trailingAnchor),
            randomWordViewcontroller.view.bottomAnchor.constraint(equalTo: contentView.randomWordView.bottomAnchor),
            

            searchDefinitionsViewController.view.topAnchor.constraint(equalTo: contentView.searchDefinitionView.topAnchor),
            searchDefinitionsViewController.view.leadingAnchor.constraint(equalTo: contentView.searchDefinitionView.leadingAnchor),
            searchDefinitionsViewController.view.trailingAnchor.constraint(equalTo: contentView.searchDefinitionView.trailingAnchor),
            searchDefinitionsViewController.view.bottomAnchor.constraint(equalTo: contentView.searchDefinitionView.bottomAnchor),
        ])
    }

}

