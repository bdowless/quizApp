//
//  FinalResultController.swift
//  QuizV2
//
//  Created by Brandon Dowless on 3/25/22.
//

import Foundation
import UIKit

class finalResultController: UIViewController {
    
    //MARK: Properties
    
    var finalResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Final Result is "
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(finalResultLabel)
        finalResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        finalResultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor) .isActive = true
        
    }
}
