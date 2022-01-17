//
//  DefinitionDetailView.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 1/16/22.
//

import Foundation
import UIKit

class DefinitionDetailsView: UIView {
    
    // MARK: - UI Properties
    
    let word: String
    let wordResults: WordResults
    
    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var definitionView: WordDetailsView = {
       let view = WordDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.infoTypeLabel.text = "Definition"
        view.descriptionLabel.text = wordResults.definition
        view.partOfSpeechLabel.text = wordResults.partOfSpeech
        view.partOfSpeechLabel.isHidden = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var synonymsView: WordDetailsView = {
       let view = WordDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = wordResults.synonyms == nil
        view.infoTypeLabel.textColor = .white
        view.infoTypeLabel.text = "Synonyms"
        view.descriptionLabel.text = wordResults.synonyms?.joined(separator: ", ")
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var antonymsView: WordDetailsView = {
       let view = WordDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = wordResults.antonyms == nil
        view.infoTypeLabel.textColor = .white
        view.infoTypeLabel.text = "Antonyms"
        view.descriptionLabel.text = wordResults.antonyms?.joined(separator: ", ")
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var exampleView: WordDetailsView = {
       let view = WordDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = wordResults.examples == nil
        view.infoTypeLabel.textColor = .white
        view.infoTypeLabel.text = "Example Usage"
        view.descriptionLabel.textColor = .lightGray
        view.descriptionLabel.text = wordResults.examples?.joined(separator: ", ")
        view.backgroundColor = .darkGray
        return view
    }()
    
    // MARK: - Initializers
    
    init(wordResults: WordResults, word: String) {
        self.wordResults = wordResults
        self.word = word
        
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        backgroundColor = UIColor(named: "DarkGray")
        
        stackView.addArrangedSubview(definitionView)
        stackView.addArrangedSubview(synonymsView)
        stackView.addArrangedSubview(antonymsView)
        stackView.addArrangedSubview(exampleView)
        
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(emptyView)
        
        scrollView.addSubview(stackView)
        
        addSubview(scrollView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}
