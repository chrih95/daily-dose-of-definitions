//
//  SearchDefinitionsViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/9/21.
//

import UIKit

protocol SearchDefinitionsDelegate: AnyObject {
    func searchDefinitions(forWord word: String?)
}

class SearchDefinitionsViewController: UIViewController {
    
    //MARK: - Properties
    
    var selectedWordResults: [WordResults]?
    var selectedWord: String?
    
    lazy var contentView = SearchDefinitionView(searchDefinitionsDelegate: self)
    
    override func loadView() {
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
        
}

extension SearchDefinitionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let selectedWord = selectedWord,
              let resulOfSelectedWord = selectedWordResults?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: DefinitionTableViewCell.identifier, for: indexPath) as? DefinitionTableViewCell else {
                  assertionFailure("Only expecting to dequeue \(DefinitionTableViewCell.self) cells")
                  return UITableViewCell()
              }
        cell.updateViews(usingWordResults: resulOfSelectedWord, ofWord: selectedWord)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedWordResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedWord = selectedWord,
              let selectedWordResults = selectedWordResults?[indexPath.row] else {
                  assertionFailure("Selectedword unexpectedly found nil")
                  return
                  
              }
        print("Selected \(selectedWord)!")
    }
    
}

extension SearchDefinitionsViewController: SearchDefinitionsDelegate {
    
    func searchDefinitions(forWord word: String?) {
        
        guard let word = word, !word.isEmpty else {
            presentMissingWordAlert()
            return
        }
        
        guard let wordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)") else {
            print("Invalid URL")
            return
        }
        
        
        let headers = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key": "90ea48b1d5msh84d3174c6860770p18bd31jsn806c0d897141"
        ]
        
        var urlRequest = URLRequest(url: wordURL)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let word = try JSONDecoder().decode(Word.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    let resultsThatIncludeADefinition = word.results?.filter { $0.definition != nil }
                    self?.selectedWordResults = resultsThatIncludeADefinition
                    self?.selectedWord = word.word
                    self?.contentView.tableView.reloadData()
                    
                    }
                }
                catch {
                    print("Failed to decode RandomWord with error: \(error.localizedDescription)")
                }
            
        }.resume()
    }
    
    private func presentMissingWordAlert() {
        let alertController = UIAlertController(title: "", message: "Please enter a word in the text field first to retrieve definitions", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
