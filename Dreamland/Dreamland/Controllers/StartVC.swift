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
    
    // Outlet to bottom constraint for when the keyboard shows & hides
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        // set to be the delegate to the text field's delegate methods
        nameTextField.delegate = self
    }
    
    // MARK: - Keyboard Hide/Unhide Methods
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfoDictionary = notification.userInfo,
            keyboardFrameValue = userInfoDictionary[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = keyboardFrameValue.CGRectValue()
                UIView.animateWithDuration(0.8) {
                    self.textFieldBottomConstraint.constant = keyboardFrame.size.height + 10
                    self.view.layoutIfNeeded()
                }
        }
    }
    
    
    func keyboardWillHide(notification: NSNotification) {
        UIView.animateWithDuration(0.8) {
            self.textFieldBottomConstraint.constant = 44
            self.view.layoutIfNeeded()
        }
    }
    
    
    // MARK: - Navigation Method
    
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


// MARK: - TextField Delegate Method for Resigning First Responder

extension StartVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
