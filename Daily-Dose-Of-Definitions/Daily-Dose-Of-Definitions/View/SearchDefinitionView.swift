//
//  SearchDefinitionView.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 12/19/21.
//

import Foundation
import UIKit

class SearchDefinitionView: UIView {
    // MARK: - Properties
    
    weak var searchDefinitionsDelegate: SearchDefinitionsDelegate?
    
    let searchTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.placeholder = "Find a word..."
        textField.backgroundColor = UIColor(named: "LightGray")
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        textField.attributedPlaceholder = NSAttributedString(string:"Find a word...", attributes: [NSAttributedString.Key.foregroundColor: .lightGray as UIColor])
        textField.leftViewMode = .always
        return textField
    }()
    
    let searchButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.tintColor = UIColor(named: "DarkGray")
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DefinitionTableViewCell.self, forCellReuseIdentifier: DefinitionTableViewCell.identifier)
        tableView.backgroundColor = UIColor(named: "DarkGray")
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(searchDefinitionsDelegate: SearchDefinitionsDelegate?) {
        super.init(frame: .zero)
        
        self.searchDefinitionsDelegate = searchDefinitionsDelegate
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(tableView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: searchButton.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Actions
        
    @objc func searchButtonPressed() {
        print(searchTextField.text ?? "")
        
        searchDefinitionsDelegate?.searchDefinitions(forWord: searchTextField.text)
    }
    
}

