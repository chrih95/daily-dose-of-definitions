//
//  MainView.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 1/1/22.
//

import Foundation
import UIKit

class MainView: UIView {
    
    // MARK: - UI Properties
    
    let headerView: HeaderView = {
       let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let randomWordView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let searchDefinitionView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        backgroundColor = UIColor(named: "DarkGray")
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up UI
    
    private func setUpUI() {
        addSubview(headerView)
        addSubview(randomWordView)
        addSubview(bottomViewBorder)
        addSubview(searchDefinitionView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: randomWordView.topAnchor, constant: -8),
             headerView.heightAnchor.constraint(equalToConstant: 150),
            
            
            randomWordView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            randomWordView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            randomWordView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            randomWordView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            
            bottomViewBorder.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 10),
            bottomViewBorder.leadingAnchor.constraint(equalTo: randomWordView.leadingAnchor),
            bottomViewBorder.trailingAnchor.constraint(equalTo: randomWordView.trailingAnchor),
            bottomViewBorder.heightAnchor.constraint(equalToConstant: 1),
            
            searchDefinitionView.topAnchor.constraint(equalTo: bottomViewBorder.bottomAnchor, constant: 10),
            searchDefinitionView.leadingAnchor.constraint(equalTo: bottomViewBorder.leadingAnchor),
            searchDefinitionView.trailingAnchor.constraint(equalTo: bottomViewBorder.trailingAnchor),
            searchDefinitionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
