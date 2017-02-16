//
//  FlickrPhotoCell.swift
//  FlickrSearch
//
//  Created by Richard Turton on 30/06/2016.
//  Copyright © 2016 Richard Turton. All rights reserved.
//

import UIKit

class FlickrPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var timage: UIImageView!
    @IBOutlet weak var label: UITextView!
    @IBOutlet weak var imagee: UIImageView!
    func configureCell(forecast: Message , vwidth : CGFloat) {
        //  label.frame.origin.x = 200
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.clear
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width : 250,height :1000)
        let estimatedframe = NSString(string: forecast.text!).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
        view.layer.masksToBounds = true
        let grayBubbleImage = UIImage(named: "bubble_gray")!.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
        let blueBubbleImage = UIImage(named: "bubble_blue")!.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
        
        let estimatedframee = NSString(string: "here am").boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
        print(estimatedframee.width)
        var finalwidth = estimatedframe.width
        if estimatedframe.width < estimatedframee.width
        {
        finalwidth = estimatedframee.width
        }
        
        // print(view.frame.minX)
        // print(view.frame.minY)
        // print(view.frame.height)
        // print(view.frame.width)
        
        if forecast.isSender == false
        {   timage.isHidden = false
            view.frame =  CGRect(x: 40,y :0,width : finalwidth + 30 ,height  : estimatedframe.height + 20)
            label.frame = CGRect(x: 15,y :0,width : view.frame.width - 15 ,height : estimatedframe.height + 20)
            timage.frame = CGRect(x: 3,y :estimatedframe.height - 10  ,width : 30 ,height : 30)
            timage.image = UIImage(named : "zuckprofile")
            label.textColor = UIColor.black
            imagee.image = grayBubbleImage
            imagee.tintColor = UIColor(white: 0.90, alpha: 1)
            imagee.frame = CGRect(x: 0,y :0,width : view.frame.width ,height : view.frame.height)
            
        }
        else
        {
            
            view.frame =  CGRect(x: vwidth - (finalwidth + 34 ) ,y :0,width :finalwidth + 22 + 8,height  : estimatedframe.height + 20)
            label.frame = CGRect(x: 8,y :0,width : finalwidth + 16 ,height : estimatedframe.height + 20)
            view.backgroundColor = UIColor.clear
            label.textColor = UIColor.white
            imagee.image = blueBubbleImage
            imagee.tintColor = UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
            imagee.frame = CGRect(x: 0,y :0,width : view.frame.width ,height : view.frame.height)
            timage.isHidden = true
            
        }
        timage.layer.cornerRadius = 15
        timage.layer.masksToBounds = true
        print(label.frame.height)
        label.text = forecast.text
    }
}
