//
//  ProgramsTableViewController.swift
//  Developers Academy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//
import UIKit
import SafariServices

class ProgramsTableViewController: UITableViewController
{

//    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var programs: [Program] = [Program.TotalIOSBlueprint(), Program.SocializeYourApps()]
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the row height dynamic
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // burger side bar menu
//        menuButton.target = revealViewController()
//        menuButton.action = "revealToggle:"
//        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Course Cell", for: indexPath) as! CourseTableViewCell
        
        let program = programs[indexPath.row]
        let mockCourse = Course(title: program.title, description: program.description, image: program.image!, programURL: program.url)
        cell.course = mockCourse
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let program = programs[indexPath.row]
        let url = program.url
        
        showWebsite(url)
    }
    
    // MARK: - Show Webpage with SFSafariViewController
    
    func showWebsite(_ url: String)
    {
        let webVC = SFSafariViewController(url: URL(string: url)!)
        webVC.delegate = self
        
        self.present(webVC, animated: true, completion: nil)
    }
}

extension ProgramsTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
}
