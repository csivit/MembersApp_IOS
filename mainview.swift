
  //
  //  ProfileViewController.swift
  //  Walkthroughs
  //
  //  Created by Udit Pandoh on 31/01/17.
  //  Copyright © 2017 Udit Pandoh. All rights reserved.
  //
 

  
class CustomerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout
   {
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
            messages = friend?.messages?.allObjects as? [Message]
            messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedAscending})
        }
    }
    
    var messages: [Message]?
    
    //Outlets for the screen
    @IBOutlet weak var topbar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputt: UIView!
    @IBOutlet weak var sind: UIButton!
    @IBOutlet weak var text: UITextField!
    
    //When send button is pressed
    @IBAction func pressedb(_ sender: Any)
    {
        setupDataa(name: text.text!,friend : friend!)
        messages = friend?.messages?.allObjects as? [Message]
        messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedAscending})
        text.text = ""
        let index = NSIndexPath(item: (messages?.count)!-1, section: 0)
        //print(messages)
        collectionView.insertItems(at: [index as IndexPath])
        let indexPathh = IndexPath(item: (messages?.count)!-1, section: 0)
        self.collectionView?.scrollToItem(at: indexPathh, at: .bottom, animated: true)
    }
    
    
    
   
   
    override func viewDidLoad() {
        //shit
        
        //navigationItem.backBarButtonItem.
        super.viewDidLoad()
        
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(CustomerViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        text.frame = CGRect(x: 10,y: text.frame.minY ,width : self.view.frame.width*3/4,height: text.frame.height)
        
        tabBarController?.tabBar.isHidden = true
        
        // Setting the boiler plate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //load data
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlekey), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //set the button properties
        sind.setTitleColor(UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1), for: .normal)
        sind.isHidden = true
        
        //set the size of collection view
       // collectionView.frame = CGRect(x: 0,y: (self.navigationController?.navigationBar.frame.height)! + 20 ,width : self.view.frame.width,height: self.view.frame.height - (inputt.frame.height + 70))
        let indexPathh = IndexPath(item: (messages?.count)! - 1, section: 0)
        self.collectionView?.scrollToItem(at: indexPathh, at: .bottom, animated: true)
        bubble.TotalIOSBlueprint()
        bubble.TotalIOSBlueprint()
        print()
       // inputt.frame = CGRect(x: 0,y: view.frame.height - 45 ,width : view.frame.width,height: 45)
        
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        print("wcwcq")
//        _ = navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
        _ = navigationController?.popViewController(animated: true)
     //   let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "new") as! CustomerViewController
      //  secondViewController.friend = messsages?[indexPath.item].friend
      //  self.navigationController?.pushViewController(viewscontr, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 211, green: 216, blue: 230, alpha: 1.0)
        //self.navigationController?.navigationBar.tintColor = UIColor.white
        //self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func handlekey(notification : NSNotification)
    {
        
        if let userInfo = notification.userInfo {
            if let keyboardSize = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect {
                  self.collectionView.frame = CGRect(x: 0,y: (self.navigationController?.navigationBar.frame.height)! + 20  ,width : self.view.frame.width,height: self.view.frame.height - (keyboardSize.height + self.inputt.frame.height + (self.navigationController?.navigationBar.frame.height)! + 25 ))

                let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                
                //  tableView.frame.origin.y -= keyboardSize.height
                inputt.frame.origin.y -= keyboardSize.height
                let isKeyboardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
               
                
                UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    
                    self.view.layoutIfNeeded()
                    
                }, completion: { (completed) in
                    
                    if isKeyboardShowing {
                      //  self.collectionView.frame = CGRect(x: 0,y: 0 ,width : self.view.frame.width,height: self.view.frame.height - (keyboardSize.height + self.inputt.frame.height - 40))
                        self.sind.isHidden = false
                        let indexPathh = IndexPath(item: (self.messages?.count)! - 1, section: 0)
                        self.collectionView?.scrollToItem(at: indexPathh, at: .bottom, animated: true)
                    }
                    
                })
                
                
            }
        }
        let indexPathh = IndexPath(item: chat.count - 1, section: 0)
        //self.collectionView?.scrollToItem(at: indexPathh, at: .bottom, animated: true)
    }
    
    //2
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("No of messages ")
        print(messages?.count)
        return (messages?.count)!
       
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
   
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flickrcell",
                                                      for: indexPath) as! FlickrPhotoCell
        //2
        let forecast = messages?[indexPath.row]
        cell.configureCell(forecast: forecast! , vwidth : view.frame.width)

        //cell.backgroundColor = UIColor.blue
        //3

        //cell.imageView.image = flickrPhoto.thumbnail
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width : 250,height :1000)
        
        let estimatedframe = NSString(string: (messages?[indexPath.row].text)!).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
        return CGSize(width: view.frame.width, height: estimatedframe.height+20)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(8, 0, 0, 0)
    }
    
    
    
   }
