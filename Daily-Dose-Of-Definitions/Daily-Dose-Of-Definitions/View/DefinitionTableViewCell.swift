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
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViews(usingWordResults wordResults: WordResults, ofWord word: String) {
        
    }
}
