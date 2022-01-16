//
//  HeaderView.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 1/4/22.
//

import Foundation
import UIKit

class HeaderView: UIView {

// MARK: - UI Properties

let dailyDoseHeading: UILabel = {
   let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
    label.textColor = .white
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.text = """
    Daily Dose
    of Definitions
    """
    return label
}()

let topViewBorder: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
}()

let dateLabel: UILabel = {
   let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.text = Date.getCurrentDate()
    label.textColor = .white
    return label
}()

// MARK: Initializers

override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUpViews()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

// MARK: Set Up UI
    
    private func setUpViews() {
        addSubview(dailyDoseHeading)
        addSubview(topViewBorder)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dailyDoseHeading.topAnchor.constraint(equalTo: topAnchor),
            dailyDoseHeading.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyDoseHeading.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            topViewBorder.topAnchor.constraint(equalTo: dailyDoseHeading.bottomAnchor, constant: 6),
            topViewBorder.leadingAnchor.constraint(equalTo: dailyDoseHeading.leadingAnchor),
            topViewBorder.trailingAnchor.constraint(equalTo: dailyDoseHeading.trailingAnchor),
            topViewBorder.heightAnchor.constraint(equalToConstant: 1),
            
            dateLabel.topAnchor.constraint(equalTo: topViewBorder.bottomAnchor, constant: 4),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: topViewBorder.trailingAnchor),
        ])
    }
    
}


