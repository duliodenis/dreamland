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

enum Story: String {
    case Haunting
    case TheScare
    case Portal
}


// MARK: Story extension
//       defines the artWork and text for the Story based on the Story enum type

extension Story {
    var artWork: UIImage {
        return UIImage(named: rawValue)!
    }
    
    var text: String {
        switch self {
        case .Haunting:
            return "Freddy and his friends were haunting people, as usual, but Freddy had other things in mind. He wanted to spook people from another dimension. Wearing a black hat, and a black bow tie around his neck, Freddy was ready to spook anyone that comes his way. The animatronic bear was so eager, that he wanted Foxy, Bonnie, and Chica to help him with his spooking. \"Hey guys,\" Freddy said. \"Wanna spook more people?\" Bonnie was the first to answer. \"Sure,\" He said. \"Let's go spook some more people. Like Mike and Jeremy are going to be our only guests!\" \"Oh… I remember when I scared Jeremy to death!\" Chica said. Chica is the only girl of the group. She loves to scare people more than anyone. \"Sure… say that.\" Foxy said. He hated to be in the group so badly. Well, he did cause the Bite Of '87."
            
        case .TheScare:
            return "\"Let's go, then!\" Bonnie said. \"Okay.\" Foxy said, not all that excited. The gang walked up to the place, where Freddy wanted to go to. But nobody was there. \"Are you sure this is where you wanna go?\" Chica asked. \"Yep.\" Freddy said. \"But, there's nobody here.\" Bonnie said. \"Uh… there is a weird looking person over there.\" Freddy said."
            
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
    
    static var story: Page {
        
        let haunting = Page(story: .Haunting)
        haunting.addChoice("Scare people", story: .TheScare)
        haunting.addChoice("Go eat", story: .Portal)
        
        return haunting
    }
    
}