//
//  Story.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit


// MARK: Story
//       The Story enumeration lists all the pages in the story

enum Story {
    case Haunting(String)
    case TheScare(String)
    case Portal
    
    // computed rawValue
    var rawValue: String {
        switch self {
        case .Haunting: return "Haunting"
        case .TheScare: return "TheScare"
        case .Portal: return "Portal"
        }
    }
}


// MARK: Story extension
//       defines the artWork and text for the Story based on the Story enum type

extension Story {
    var artWork: UIImage {
        return UIImage(named: rawValue)!
    }
    
    var text: String {
        switch self {
        case .Haunting(let name):
            return "Freddy, \(name) and his friends were haunting people, as usual, but Freddy had other things in mind. He wanted to spook people from another dimension."
            
        case .TheScare(let name):
            return "\"Let's go, then!\" \(name) said. \"Okay.\" Foxy said, not all that excited."
            
        case .Portal:
            return "They went off to the Pizzeria, so they could scare Mike or Jeremy, again! But they saw a portal instead. A portal, that sends them into another world."
        }
    }
}


// MARK: Page Class
//       A page has a story and two optional choice tuples that contain the possible outcomes
//       The Choice tuple is an anonymous struct composed of a string and a page

class Page {
    let story: Story
    
    typealias Choice = (title: String, page: Page)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }
}


// MARK: Page Extension
//       provides adding choices to the page

extension Page {
    
    // add a choice given the story which creates a page and calls
    // the addChoice(title, page) method
    
    func addChoice(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addChoice(title, page: page)
    }
    
    
    // add a choice to a page using a switch
    
    func addChoice(title: String, page: Page) -> Page {
        switch (firstChoice, secondChoice) {
            case (.Some, .Some) :                 break
            case (.None, .None), (.None, .Some) : firstChoice  = (title, page)
            case (.Some, .None) :                 secondChoice = (title, page)
        }
        
        return page
    }
    
}


// MARK: Adventure struct
//       provides a tree of pages

struct Adventure {
    
    static func story(name: String) -> Page {
        
        let haunting = Page(story: .Haunting(name))
        haunting.addChoice("Scare people", story: .TheScare(name))
        haunting.addChoice("Go eat", story: .Portal)
        
        return haunting
    }
    
}