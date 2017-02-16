//
//  chatTable.swift
//  HamburgerMenu
//
//  Created by Udit Pandoh on 04/02/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import Foundation

//
//  ProfileViewController.swift
//  Walkthroughs
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//


import CoreData
class chatTable: UIViewController,UITableViewDataSource , UITableViewDelegate
{
  //  var messsages: [Message]?
    @IBOutlet weak var tableView: UITableView!
   
    
    
    @IBAction func pressed(_ sender: Any) {
        setupData()
        print("||")
        print(messsages?.count)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        print("||||||||||||||=----------")
        tabBarController?.tabBar.isHidden = false
        //tableView.frame = CGRect(x: 0,y: (self.navigationController?.navigationBar.frame.height)! + 50  ,width : self.view.frame.width ,height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)! )
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        print("-----")
        print(messsages?.count)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        tableView.reloadData()
        
         tabBarController?.tabBar.isHidden = false
       // self.navigationController?.navigationBar.barTintColor = UIColor(red: 211, green: 216, blue: 230, alpha: 0)
      //  self.navigationController?.navigationBar.tintColor = UIColor.white
       //self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = messsages?.count {
            return count
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableCell", for: indexPath) as! chatTableCell
        //let person = people[indexPath.row]
  //          person.value(forKeyPath: "name") as? String
        cell.configureCell(message: (messsages?[indexPath.row])!)
        
        cell.frame = CGRect(x: 0,y: 0  ,width : tableView.frame.width,height: cell.frame.height )
        return cell
    }
    
   
    
    // MARK: - Social Sharing
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
//    {
//       //
//       
//    }
//    
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
         tableView.deselectRow(at: indexPath, animated: true)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "new") as! CustomerViewController
        secondViewController.friend = messsages?[indexPath.item].friend
        self.navigationController?.show(secondViewController, sender: Any?.self)
       // pushViewController(secondViewController, animated: true)
        
    }
    
  
    
    
    


}





