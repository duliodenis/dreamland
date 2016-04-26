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
    let firstChoiceButton = CustomButton(type: .System)
    let secondChoiceButton = CustomButton(type: .System)
    
    
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
            
            let attributedString = NSMutableAttributedString(string: pageExists.story.text)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            
            storyLabel.attributedText = attributedString
            
            if let firstChoice = pageExists.firstChoice {
                firstChoiceButton.setTitle(firstChoice.title, forState: .Normal)
                firstChoiceButton.addTarget(self, action: Selector("loadFirstChoice"), forControlEvents: .TouchUpInside)
            } else {
                firstChoiceButton.setTitle("Play Again", forState: .Normal)
                firstChoiceButton.addTarget(self, action: Selector("playAgain"), forControlEvents: .TouchUpInside)
            }
            
            if let secondChoice = pageExists.secondChoice {
                secondChoiceButton.setTitle(secondChoice.title, forState: .Normal)
                secondChoiceButton.addTarget(self, action: Selector("loadSecondChoice"), forControlEvents: .TouchUpInside)
            }
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
            storyLabel.topAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -48.0)
            ])
        
        
        view.addSubview(firstChoiceButton)
        firstChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            firstChoiceButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            firstChoiceButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -80.0)
            ])
        
        view.addSubview(secondChoiceButton)
        secondChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            secondChoiceButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            secondChoiceButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -32.0)
            ])
    }
    
    
    // MARK: - Choice Loading
    
    func loadFirstChoice() {
        if let pageExists = page, firstChoice = pageExists.firstChoice {
            let nextPage = firstChoice.page
            let pageController = PageController(page: nextPage)
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    func loadSecondChoice() {
        if let pageExists = page, secondChoice = pageExists.secondChoice {
            let nextPage = secondChoice.page
            let pageController = PageController(page: nextPage)
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    func playAgain() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
