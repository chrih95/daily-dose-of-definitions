//
//  RandomWordView.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 1/10/22.
//

import Foundation
import UIKit

class RandomWordView: UIView {
    
    weak var randomWordGeneratableDelegate: RandomWordGeneratable?
    
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
    
    // MARK: - Initializers
    
    init(randomWordGeneratableDelegate: RandomWordGeneratable?) {
        super.init(frame: .zero)
        
        self.randomWordGeneratableDelegate = randomWordGeneratableDelegate
        
        layer.cornerRadius = 30
        backgroundColor = UIColor(named: "LightGray")
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(randomWordLabel)
        addSubview(randomWordDescription)
        addSubview(randomWordDefinition)
        addSubview(randomWord)
        addSubview(refreshButton)
        
        randomWordDescription.font = randomWordDescription.font.italic
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            randomWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            randomWordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            randomWordLabel.trailingAnchor.constraint(equalTo: randomWordDescription.leadingAnchor, constant: -4),
            
            randomWordDescription.leadingAnchor.constraint(equalTo: randomWordLabel.trailingAnchor, constant: 4),
            randomWordDescription.bottomAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: -4),
            
            randomWordDefinition.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 8),
            randomWordDefinition.leadingAnchor.constraint(equalTo: randomWordLabel.leadingAnchor),
            randomWordDefinition.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            refreshButton.leadingAnchor.constraint(equalTo: randomWordLabel.leadingAnchor),
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            refreshButton.heightAnchor.constraint(equalToConstant: 30),
            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor),
            
            randomWord.leadingAnchor.constraint(equalTo: refreshButton.trailingAnchor, constant: 5),
            randomWord.centerYAnchor.constraint(equalTo: refreshButton.centerYAnchor),
        ])
    }
    
    
    // MARK: - Actions
    
    @objc func refreshButtonPressed() {
        print("Refresh Pressed")
        randomWordGeneratableDelegate?.generateRandomWordToDisplay()
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
