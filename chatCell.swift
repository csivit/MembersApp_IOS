//
//  WeatherCell.swift
//  rainyshinycloudy
//
///  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import UIKit

class chatCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UITextView!
   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var timage: UIImageView!
    
  
    
    func configureCell(forecast: bubble , vwidth : CGFloat) {
      //  label.frame.origin.x = 200
       view.layer.cornerRadius = 15
       view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width : 250,height :1000)
        let estimatedframe = NSString(string: forecast.text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
        view.layer.masksToBounds = true
    
       // print(view.frame.minX)
       // print(view.frame.minY)
       // print(view.frame.height)
       // print(view.frame.width)
        
        if forecast.sender == 1
        {
            view.frame =  CGRect(x: 40,y :0,width : estimatedframe.width + 24 ,height  : estimatedframe.height + 20)
            label.frame = CGRect(x: 8,y :0,width : estimatedframe.width + 16 ,height : estimatedframe.height + 20)
            timage.frame = CGRect(x: 3,y :estimatedframe.height - 10  ,width : 30 ,height : 30)
        }
        else
        {
            view.frame =  CGRect(x: vwidth - (estimatedframe.width + 64 ) ,y :0,width :estimatedframe.width + 16 + 8,height  : estimatedframe.height + 20)
            label.frame = CGRect(x: 8,y :0,width : estimatedframe.width + 16 ,height : estimatedframe.height + 20)
            timage.frame = CGRect(x: vwidth - 3 - 30,y :estimatedframe.height - 10  ,width : 30 ,height : 30)
            view.backgroundColor = UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
            label.textColor = UIColor.white
            
        }
        timage.layer.cornerRadius = 15
        timage.layer.masksToBounds = true
        print(label.frame.height)
        label.text = forecast.text
    }
    
}
