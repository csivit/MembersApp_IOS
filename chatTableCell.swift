//
//  TableViewCell.swift
//  Developers Academy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import UIKit
import CoreData
class chatTableCell: UITableViewCell {
    
    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var datalabel: UILabel!
   
    
    
    
    
    func configureCell(message: Message) {
        
        
       
            label1.text = message.friend?.name
            
        
                imagee.image = #imageLiteral(resourceName: "zuckprofile")
        imagee.image =  UIImage(named: (message.friend?.profileImageName)!)   
                imagee.layer.cornerRadius = 30
                imagee.layer.masksToBounds = true
            
//
            label2.text = message.text
//            
            if let date = message.date {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                
                let elapsedTimeInSeconds = Date().timeIntervalSince(date as Date)
                
                let secondInDays: TimeInterval = 60 * 60 * 24
                
                if elapsedTimeInSeconds > 7 * secondInDays {
                    dateFormatter.dateFormat = "MM/dd/yy"
                } else if elapsedTimeInSeconds > secondInDays {
                    dateFormatter.dateFormat = "EEE"
                }
                
                datalabel.text = dateFormatter.string(from: date as Date)
            }
        
        
        
    }


    
}
