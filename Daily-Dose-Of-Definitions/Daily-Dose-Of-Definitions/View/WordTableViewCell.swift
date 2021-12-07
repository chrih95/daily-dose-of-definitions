//
//  WordTableViewCell.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 10/27/21.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    
    private let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "happy"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let wordPartOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private let wordDefinition: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.text = "marked by good fortune"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
