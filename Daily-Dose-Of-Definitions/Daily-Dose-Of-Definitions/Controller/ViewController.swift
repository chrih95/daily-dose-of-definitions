//
//  ViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let randomWordView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let searchDefinitionsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        addRandomWordViewController()
        addSearchDefinitionsViewController()
    }

    private func setUpUI() {
        view.backgroundColor = .white
        
        view.addSubview(randomWordView)
        view.addSubview(searchDefinitionsView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            randomWordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            randomWordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            randomWordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            randomWordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            searchDefinitionsView.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 30),
            searchDefinitionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchDefinitionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchDefinitionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func addRandomWordViewController() {
        let randomWordViewcontroller = RandomWordViewController()
        addChild(randomWordViewcontroller)
        randomWordView.addSubview(randomWordViewcontroller.view)
        randomWordViewcontroller.didMove(toParent: self)
        randomWordViewcontroller.view.frame = randomWordView.frame
    }
    
    private func addSearchDefinitionsViewController() {
        let searchDefinitionsViewController = SearchDefinitionsViewController()
        addChild(searchDefinitionsViewController)
        searchDefinitionsView.addSubview(searchDefinitionsViewController.view)
        searchDefinitionsViewController.didMove(toParent: self)
        searchDefinitionsViewController.view.frame = searchDefinitionsView.frame
    }

}

