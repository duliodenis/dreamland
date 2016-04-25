//
//  PageController.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/24/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class PageController: UIViewController {

    var page: Page?
    
    let artWork = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: .System)
    let secondChoiceButton = UIButton(type: .System)
    
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pageExists = page {
            artWork.image = pageExists.story.artWork
            storyLabel.text = pageExists.story.text
        }
    }
    
    
    // MARK: - Sub View Layout
    
    override func viewWillLayoutSubviews() {
        view.addSubview(artWork)
        artWork.translatesAutoresizingMaskIntoConstraints = false
        artWork.contentMode = .ScaleAspectFill

        NSLayoutConstraint.activateConstraints([
            artWork.topAnchor.constraintEqualToAnchor(view.topAnchor),
            artWork.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            artWork.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            artWork.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
            ])
        
        
        view.addSubview(storyLabel)
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        storyLabel.numberOfLines = 0
        storyLabel.textColor = .whiteColor()
        
        NSLayoutConstraint.activateConstraints([
            storyLabel.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 16.0),
            storyLabel.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -16.0),
            storyLabel.topAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -48.0),
            
            ])
        
        
        view.addSubview(firstChoiceButton)
        firstChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondChoiceButton)
        secondChoiceButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
