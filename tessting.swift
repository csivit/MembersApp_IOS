//
//  ChatLogController.swift
//  fbMessenger
//
//  Created by Brian Voong on 4/8/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
   var chat  = [bubble]()
    
    let messageInputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message..."
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: UIControlState())
        let titleColor = UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
        button.setTitleColor(titleColor, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        chat.append(b1)
        chat.append(b2)
        chat.append(b3)
        tabBarController?.tabBar.isHidden = true
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(messageInputContainerView)
        //view.addConstraintsWithFormat("H:|[v0]|",   views: messageInputContainerView)
        //view.addConstraintsWithFormat("V:[v0(48)]", views: messageInputContainerView)
        messageInputContainerView.frame =  CGRect(x:  100, y: 400, width: 160, height: 20)
        bottomConstraint = NSLayoutConstraint(item: messageInputContainerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        // view.addConstraint(bottomConstraint!)
        
        setupInputComponents()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func handleKeyboardNotification(_ notification: Notification) {
        
        if let userInfo = notification.userInfo {
            
            //let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
            // print(keyboardFrame)
            
            //let isKeyboardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            // bottomConstraint?.constant = isKeyboardShowing ? -keyboardFrame!.height : 0
            
            //            UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            //
            //                self.view.layoutIfNeeded()
            //
            //                }, completion: { (completed) in
            //
            //                    if isKeyboardShowing {
            //                        //let indexPath = IndexPath(item: self.messages!.count - 1, section: 0)
            //                        //self.collectionView?.scrollToItem(at: indexPath, at: .bottom, animated: true)
            //                    }
            //
            //            })
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        inputTextField.endEditing(true)
    }
    
    fileprivate func setupInputComponents() {
        let topBorderView = UIView()
        topBorderView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        messageInputContainerView.addSubview(inputTextField)
        messageInputContainerView.addSubview(sendButton)
        messageInputContainerView.addSubview(topBorderView)
        
        messageInputContainerView.addConstraintsWithFormat("H:|-8-[v0][v1(60)]|", views: inputTextField, sendButton)
        
        messageInputContainerView.addConstraintsWithFormat("V:|[v0]|", views: inputTextField)
        messageInputContainerView.addConstraintsWithFormat("V:|[v0]|", views: sendButton)
        
        messageInputContainerView.addConstraintsWithFormat("H:|[v0]|", views: topBorderView)
        messageInputContainerView.addConstraintsWithFormat("V:|[v0(0.5)]", views: topBorderView)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatLogMessageCell
        
        cell.messageTextView.text = messages?[indexPath.item].text
        
        if let message = messages?[indexPath.item], let messageText = message.text, let profileImageName = message.friend?.profileImageName {
            
            
            cell.backgroundColor = UIColor.blue
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
            
            if message.isSender == nil || !message.isSender!.boolValue {
                cell.messageTextView.frame = CGRect(x: 48 + 8, y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height + 20)
                
                
                cell.messageTextView.textColor = UIColor.black
                
            } else {
                
                //outgoing sending message
                
                cell.messageTextView.frame = CGRect(x: view.frame.width - estimatedFrame.width - 16 - 16 - 8, y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height + 20)
                
                
                
                cell.messageTextView.textColor = UIColor.white
            }
            
            
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let messageText = messages?[indexPath.item].text {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 60)
        }
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
}

class ChatLogMessageCell: BaseCell {
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "Sample message"
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(messageTextView)
        
        
    }
    
}








