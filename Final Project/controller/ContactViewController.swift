//
//  ContactViewController.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/19/20.
//  email : Hern784@usc.edu
//

import UIKit
import PDFKit
import MessageUI

class ContactViewController: UIViewController {
    
    
    @IBOutlet weak var pdfView: PDFView!
    
    // function to share resume as a pdf through email
    
    @IBAction func share(_ sender: UIButton) {
        
        
        // prepare email using MessageUI
        
        if MFMailComposeViewController.canSendMail() {
                
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("Check out this candidate!")
            mailVC.setMessageBody("Hey\n\n I came across this resume and I thought you might like it.", isHTML: false)
                
            if let filePath = Bundle.main.path(forResource: "resumeRH", ofType: "pdf")
            {
                if let fileData = NSData(contentsOfFile: filePath)
                {
                    mailVC.addAttachmentData(fileData as Data, mimeType: "application/pdf", fileName: "resumeRH.pdf")
                }
            }
            
            present(mailVC, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        // Display PDF usig PDF kit
        guard Bundle.main.path(forResource: "resumeRH", ofType: "pdf") != nil else {return}
        
        let url = Bundle.main.url(forResource: "resumeRH", withExtension: "pdf")
        
        if let pdfDoc = PDFDocument(url: url!) {
            pdfView.autoScales = true
            pdfView.displayMode = .singlePageContinuous
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDoc
        }
    }

}
