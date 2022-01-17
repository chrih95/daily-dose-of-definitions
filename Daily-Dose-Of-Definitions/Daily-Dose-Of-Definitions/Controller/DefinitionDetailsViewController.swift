//
//  DefinitionDetailsViewController.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 1/16/22.
//

import Foundation
import UIKit

class DefinitionDetailsViewController: UIViewController {

    // MARK: - UI Properties
    
    let contentView: DefinitionDetailsView!
    let wordResults: WordResults
    let word: String
    
    // MARK: - Initializers
    
    init(wordResults: WordResults, word: String) {
        self.wordResults = wordResults
        self.word = word
        self.contentView = DefinitionDetailsView(wordResults: wordResults, word: word)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.title = word
    }
}

