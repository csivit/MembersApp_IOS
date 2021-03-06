////
////  FriendsControllerHelper.swift
////  fbMessenger
////
////  Created by Brian Voong on 4/4/16.
////  Copyright © 2016 letsbuildthatapp. All rights reserved.
////
//
import UIKit
import CoreData
extension CustomerViewController{
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext {
            
            do {
                
                let entityNames = ["Friend", "Message"]
                
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    
                    for object in objects! {
                        context.delete(object)
                    }
                }
                
                try(context.save())
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
    //
    func setupData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext {
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            mark.name = "Mark Zuckerberg"
            mark.profileImageName = "zuckprofile"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.friend = mark
            message.text = "Hello, my name is Mark. Nice to meet you..."
            message.date = Date() as NSDate?
            
            createSteveMessagesWithContext(context)
            
            let donald = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            donald.name = "Donald Trump"
            donald.profileImageName = "donald_trump_profile"
            
            createMessageWithText("You're fired", friend: donald, minutesAgo: 5, context: context)
            
            let gandhi = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            gandhi.name = "Mahatma Gandhi"
            gandhi.profileImageName = "gandhi"
            
            createMessageWithText("Love, Peace, and Joy", friend: gandhi, minutesAgo: 60 * 24, context: context)
            
            let hillary = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            hillary.name = "Hillary Clinton"
            hillary.profileImageName = "hillary_profile"
            
            createMessageWithText("Please vote for me, you did for Billy!", friend: hillary, minutesAgo: 8 * 60 * 24, context: context)
            
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        loadData()
        
    }
    //
    
    func setupDataa(name: String,friend : Friend) {
        
        
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext {
            
            //let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            // mark.name = name
            //mark.profileImageName = "zuckprofile"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.friend = friend
            message.text = name
            message.date = Date() as NSDate?
            message.isSender  = true
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        
        
    }
    
    //
    
    fileprivate func createSteveMessagesWithContext(_ context: NSManagedObjectContext) {
        let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
        steve.name = "Steve Jobs"
        steve.profileImageName = "steve_profile"
        
        createMessageWithText("Good morning..", friend: steve, minutesAgo: 3, context: context)
        createMessageWithText("Hello, how are you? Hope you are having a good morning!", friend: steve, minutesAgo: 2, context: context)
        createMessageWithText("Are you interested in buying an Apple device? We have a wide variety of Apple devices that will suit your needs.  Please make your purchase with us.", friend: steve, minutesAgo: 1, context: context)
        
        //response message
        createMessageWithText("Yes, totally looking to buy an iPhone 7.", friend: steve, minutesAgo: 1, context: context, isSender: true)
        
        createMessageWithText("Totally understand that you want the new iPhone 7, but you'll have to wait until September for the new release. Sorry but thats just how Apple likes to do things.", friend: steve, minutesAgo: 1, context: context)
        
        createMessageWithText("Absolutely, I'll just use my gigantic iPhone 6 Plus until then!!!", friend: steve, minutesAgo: 1, context: context, isSender: true)
        
        createMessageWithText("Absolutely, I'll just use my gigantic iPhone 6 Plus until then!!!", friend: steve, minutesAgo: 1, context: context, isSender: true)
    }
    
    fileprivate func createMessageWithText(_ text: String, friend: Friend, minutesAgo: Double, context: NSManagedObjectContext, isSender: Bool = false) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.friend = friend
        message.text = text
        message.date = Date().addingTimeInterval(-minutesAgo * 60) as NSDate?
        message.isSender = NSNumber(value: isSender as Bool) as Bool
    }
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.managedObjectContext {
            
            if let friends = fetchFriends() {
                
               // messages = [Message]()
                
                for friend in friends {
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    fetchRequest.fetchLimit = 1
                    
                    do {
                        
                        let fetchedMessages = try(context.fetch(fetchRequest)) as? [Message]
                        messsages?.append(contentsOf: fetchedMessages!)
                        
                    } catch let err {
                        print(err)
                    }
                }
                
                messsages = messsages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending})
                
            }
        }
    }
    
    fileprivate func fetchFriends() -> [Friend]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.managedObjectContext {
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            
            do {
                
                return try context.fetch(request) as? [Friend]
                
            } catch let err {
                print(err)
            }
            
        }
        
        return nil
    }
    
}
//
//
//
//
//
//
