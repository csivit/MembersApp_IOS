//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import UIKit
//import Alamofire

class ChatVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var chat  = [bubble]()
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputt: UIView!
    
   
    let messageInputContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let inputTextField : UITextField = {
        let textField = UITextField ()
        return textField
    }()
    
    
//    @IBOutlet weak var tableView: UITableView!
    var bottomConstraint : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
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
        chat.append(b5)
        
        
        view.addSubview(messageInputContainerView)
        
        //bottomConstraint = NSLayoutConstraint(item: inputt, attribute: .bottom , relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -400)
        //view.addConstraint(bottomConstraint!)
        NotificationCenter.default.addObserver(self,selector : #selector(handlekey),name: NSNotification.Name.UIKeyboardWillShow,object : nil)
    
        tableView.delegate = self
        tableView.dataSource = self
    
    
}

  func handlekey(notification : NSNotification)
 {

  if let userInfo = notification.userInfo {
    if let keyboardSize = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect {
let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        print("fdg")
        print(keyboardSize)
      //  tableView.frame.origin.y -= keyboardSize.height
        inputt.frame.origin.y -= keyboardSize.height
        let isKeyboardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
        
        //bottomConstraint?.constant = isKeyboardShowing ? -keyboardFrame!.height : 0
        
        UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: { (completed) in
            
            if isKeyboardShowing {
                //let indexPathh = IndexPath(item: self.chat.count - 1, section: 0)
                //self.tableView.scrollToRow(at: indexPathh, at: .bottom, animated: true)
            }
            
        })
        
      
}
}
}

    //


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let size = CGSize(width : 250,height :1000)
    
    let estimatedframe = NSString(string: chat[indexPath.row].text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
    
        return  estimatedframe.height + 25
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? chatCell {
            
            let forecast = chat[indexPath.row]
            cell.configureCell(forecast: forecast , vwidth : view.frame.width)
            return cell
        } else {
            return chatCell()
        }
    }
    
   
    
}

