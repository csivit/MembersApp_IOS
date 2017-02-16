
//
//  ProfileViewController.swift
//  Walkthroughs
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import Alamofire
var key = ""
class LoginViewController: UIViewController{
    
    
    
    @IBOutlet weak var registrstion: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBAction func clicked(_ sender: Any) {
        
        let parameters = [
            "email" : name.text,
            "password" : name.text
        ]
        
        
        Alamofire.request(FORECAST_URLL,method : .post, parameters : parameters, encoding : JSONEncoding.default ).responseJSON { response in
            let result = response.result
            if let value: AnyObject = response.result.value as AnyObject?{
            print(result)
                }
            }
        }
    
   
    
    
    override func viewDidLoad() {
        
        
    }
    
    
   
    
   
    
    
    
}
