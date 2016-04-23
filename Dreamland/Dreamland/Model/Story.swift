//
//  Story.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

enum Story: String {
    case Haunting
    case TheScare
    case Portal
}

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
