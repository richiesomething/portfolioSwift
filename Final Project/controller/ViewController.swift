//
//  ViewController.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/18/20.
//  email : Hern784@usc.edu
//

import UIKit
import MessageUI

class MainViewController: UIViewController {
    
    private var model = ProjectModel.shared

    
    // Redirect to personal website
    @IBAction func info(_ sender: UIButton) {
        if let url = URL(string: "http://richardhernandez.info") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    // Redirect to linked in profile
    @IBAction func linkedin(_ sender: UIButton) {
        if let url = URL(string: "https://www.linkedin.com/in/richard-hernandez-002864187/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    
    // Send email to hern784@usc.edu
    @IBAction func email(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
                
            let mailVC = MFMailComposeViewController()
            mailVC.setToRecipients(["hern784@usc.edu"])
            mailVC.setSubject("Reaching out from RH.info")
            mailVC.setMessageBody("Hi Richard\n\n I came across your app and wanted to reach out.", isHTML: false)
                
            present(mailVC, animated: true)
                
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

