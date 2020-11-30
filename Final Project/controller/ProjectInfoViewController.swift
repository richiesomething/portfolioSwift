//
//  ProjectInfoViewController.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/18/20.
//

import UIKit

class ProjectInfoViewController: UIViewController {
    
    private var model = ProjectModel.shared
    var project: Project?
    var nameFromTable: String = ""

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var hashtags: UILabel!
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        project = model.getProject(byName: nameFromTable)

        name.text = project?.name
        language.text = project?.language
        projectDescription.text = project?.descrption
        hashtags.text = project?.hashtags.joined(separator: ", ")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
