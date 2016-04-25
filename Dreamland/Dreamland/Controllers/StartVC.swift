//
//  StartVC.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PageController" {
            if let pageController = segue.destinationViewController as? PageController {
                pageController.page = Adventure.story
            }
        }
    }
    
}
