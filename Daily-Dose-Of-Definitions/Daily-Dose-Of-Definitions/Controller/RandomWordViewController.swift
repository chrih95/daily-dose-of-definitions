//
//  RandomWordViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/9/21.
//

import UIKit

protocol RandomWordGeneratable: AnyObject {
    func generateRandomWordToDisplay()
}

class RandomWordViewController: UIViewController {
    
    lazy var randomWordView = RandomWordView(randomWordGeneratableDelegate: self)
    
    let headers = [
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
        "x-rapidapi-key": "90ea48b1d5msh84d3174c6860770p18bd31jsn806c0d897141"
    ]
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshButtonPressed()
    }

    override func loadView() {
        view = randomWordView
    }

    
    
    @objc func refreshButtonPressed() {
        refreshWord { word, error in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async { [weak self] in
                self?.randomWordView.randomWordLabel.text = word?.word
                self?.randomWordView.randomWordDescription.text = word?.results?[0].partOfSpeech
                self?.randomWordView.randomWordDefinition.text = word?.results?[0].definition
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

extension RandomWordViewController: RandomWordGeneratable {
    func generateRandomWordToDisplay() {
        refreshButtonPressed()
    }
}

