//
//  StartVC.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    // ErrorType Enum
    enum Error: ErrorType {
        case noName
    }

    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PageController" {
            
            
            do {
                if let name = nameTextField.text {
                    if name == "" {
                        throw Error.noName
                    }
                    
                    if let pageController = segue.destinationViewController as? PageController {
                        pageController.page = Adventure.story(name)
                    }
                }
            } catch Error.noName {
                
                let alertController = UIAlertController(title: "No name provided", message: "Please enter a name to start your adventure.", preferredStyle: .Alert)
                
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(action)
                presentViewController(alertController, animated: true, completion: nil)
                
            } catch let error {
                fatalError("\(error)")
            }
        }
    }
    
}
