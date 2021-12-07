//
//  SearchDefinitionsViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/9/21.
//

import UIKit

class SearchDefinitionsViewController: UIViewController, UITableViewDataSource {
    
    //MARK: - Properties
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "LightGray")
        return tableView
    }()
    
    let headers = [
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
        "x-rapidapi-key": "90ea48b1d5msh84d3174c6860770p18bd31jsn806c0d897141"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        
        //view.addSubview(tableView)

        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            searchTextField.heightAnchor.constraint(equalToConstant: 35),
            
            searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func searchButtonPressed() {
        print(searchTextField.text ?? "")
        
        findDefinitions { word, error in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async { [weak self] in
                print("Success!")
            }
        }
    }
    
    private func findDefinitions(completion: @escaping (Word?, Error?) -> Void) {
        guard let wordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(searchTextField.text ?? "default")") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: wordURL)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let word = try JSONDecoder().decode(Word.self, from: data)
                completion(word, error)
                print(word)
            }
            catch {
                print("Failed to convert \(error.localizedDescription)")
                completion(nil, error)
            }
            
        }.resume()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = UIColor(named: "LightGray")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
}
