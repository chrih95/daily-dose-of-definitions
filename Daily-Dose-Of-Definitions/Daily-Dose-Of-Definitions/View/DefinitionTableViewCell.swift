//
//  DefinitionTableViewCell.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 12/19/21.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    static let identifier = DefinitionTableViewCell.self.description()
    
    let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "happy"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    let definitionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "marked by good fortune"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    let partOfSpeechLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "adjective"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        contentView.backgroundColor = UIColor(named: "DarkGray")
        
        containerView.addSubview(wordLabel)
        containerView.addSubview(definitionLabel)
        containerView.addSubview(partOfSpeechLabel)
        
        contentView.addSubview(containerView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 4),
            partOfSpeechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
            
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            definitionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    func updateViews(usingWordResults wordResults: WordResults, ofWord word: String) {
        
        wordLabel.text = word
        partOfSpeechLabel.text = wordResults.partOfSpeech
        definitionLabel.text = wordResults.definition
    }
}
