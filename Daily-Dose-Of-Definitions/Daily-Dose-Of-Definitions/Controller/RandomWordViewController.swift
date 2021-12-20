//
//  RandomWordViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/9/21.
//

import UIKit

class RandomWordViewController: UIViewController {
    
    //MARK: - UI Properties
    
    let randomWordLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let randomWordDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let randomWordDefinition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.text = """
        creating a sequence of intstructions to
        enable the computer to do something
        """
        return label
    }()
    
    let randomWord: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "Random Word"
        label.textColor = .gray
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.clockwise.circle"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let headers = [
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
        "x-rapidapi-key": "90ea48b1d5msh84d3174c6860770p18bd31jsn806c0d897141"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshButtonPressed()

        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = UIColor(named: "LightGray")
        
        view.addSubview(randomWordLabel)
        view.addSubview(randomWordDescription)
        view.addSubview(randomWordDefinition)
        view.addSubview(randomWord)
        view.addSubview(refreshButton)
        
        randomWordDescription.font = randomWordDescription.font.italic
        
        view.layer.cornerRadius = 30
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            randomWordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            randomWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            randomWordDescription.leadingAnchor.constraint(equalTo: randomWordLabel.trailingAnchor, constant: 10),
            randomWordDescription.bottomAnchor.constraint(equalTo: randomWordLabel.bottomAnchor),
            
            randomWordDefinition.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 5),
            randomWordDefinition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            randomWordDefinition.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            randomWord.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            randomWord.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            refreshButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            refreshButton.heightAnchor.constraint(equalToConstant: 35),
            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor),
        ])
    }
    
    @objc func refreshButtonPressed() {
        refreshWord { word, error in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async { [weak self] in
                self?.randomWordLabel.text = word?.word
                self?.randomWordDescription.text = word?.results[0].partOfSpeech
                self?.randomWordDefinition.text = word?.results[0].definition
            }
        }
    }
    
    private func refreshWord(completion: @escaping (Word?, Error?) -> Void) {
        guard let wordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true") else {
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
}

extension UIFont {
    var italic: UIFont {
        return with(.traitItalic)
    }
    
    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
