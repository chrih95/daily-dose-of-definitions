//
//  ViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let dailyDoseHeading: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = """
        Daily Dose
        of Definitions
        """
        return label
    }()
    
    let topViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = Date.getCurrentDate()
        label.textColor = .white
        return label
    }()
    
    let randomWordView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        return view
    }()
    
    let bottomViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let searchDefinitionsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    //MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        addRandomWordViewController()
        addSearchDefinitionsViewController()
    }
    
    //MARK: - UI Setup

    private func setUpUI() {
        view.backgroundColor = UIColor(named: "DarkGray")
        
        view.addSubview(dailyDoseHeading)
        view.addSubview(topViewBorder)
        view.addSubview(dateLabel)
        
        view.addSubview(randomWordView)
        view.addSubview(bottomViewBorder)
        view.addSubview(searchDefinitionsView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            dailyDoseHeading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dailyDoseHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            topViewBorder.topAnchor.constraint(equalTo: dailyDoseHeading.bottomAnchor, constant: 10),
            topViewBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topViewBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topViewBorder.heightAnchor.constraint(equalToConstant: 1),
            
            dateLabel.topAnchor.constraint(equalTo: topViewBorder.bottomAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            
            randomWordView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            randomWordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            randomWordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            randomWordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            bottomViewBorder.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 20),
            bottomViewBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomViewBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomViewBorder.heightAnchor.constraint(equalToConstant: 1),

            searchDefinitionsView.topAnchor.constraint(equalTo: bottomViewBorder.bottomAnchor, constant: 30),
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

extension Date {
    static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"

        return dateFormatter.string(from: Date())
    }
}

