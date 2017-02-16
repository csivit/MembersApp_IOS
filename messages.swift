//
//  Program.swift
//  Developers Academy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//
import UIKit
import Alamofire
var chat  = [bubble]()
class bubble {
    
    var text: String!
    var sender: Int!
    
    init(text: String, sender: Int) {
        
        self.text = text
        self.sender = sender
        
        
    }
    
    static func TotalIOSBlueprint() 
    {
        var b1 = bubble(text: "hey there", sender: 1)
        var b2 = bubble(text: "hi how are you ?", sender: 0)
        var b3 = bubble(text: "Im good you say its been so long hast it tell me about yourself", sender: 1)
        var b4 = bubble(text: "Well im working at apple now", sender: 0)
        var b5 = bubble(text: "Can i get an iPhone 7 ?", sender: 1)
        var b6 = bubble(text: "lol yes", sender: 0)
        chat.append(b1)
        chat.append(b2)
        chat.append(b3)
        chat.append(b4)
        chat.append(b5)
        chat.append(b6)
    }
    
    
}















