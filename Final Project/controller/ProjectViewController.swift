//
//  ProjectViewController.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/18/20.
//

import UIKit

class ProjectViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    private var model = ProjectModel.shared
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var searchBarKeyboard: UISearchBar!
    @IBOutlet var fullView: UIView!
    
    // close textfield when tapping elsewhere
    func textFieldShouldReturn(_ textField: UISearchBar) -> Bool {
        searchBarKeyboard.resignFirstResponder()
        return true
    }
    
    // close textfield on background touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first

        if searchBarKeyboard.isFirstResponder && touch?.view != searchBarKeyboard {
            searchBarKeyboard.resignFirstResponder()
        }
        else if fullView.isFirstResponder && touch?.view != fullView {
            fullView.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
    }
    
    /*
     
     following functions named: searchForJava, searchForCCPP, etc
     search in the projects model for projects that are either coded in that language
     or have a hashtage of the corresponding name.
     Resulting projects are displayed in the tableview
     
     **/
    
    @IBAction func searchForJava(_ sender: UIButton) {
        updateTable(hashtag: "java")
    }
    
    
    @IBAction func searchForCCPP(_ sender: UIButton) {
        updateTable(hashtag: "c")
        model.appendProjects(thatHave: "cpp")
        tableView?.reloadData()
    }
    

    @IBAction func searchForPython(_ sender: UIButton) {
        updateTable(hashtag: "python")
    }
    
    @IBAction func searchForSchoolProjects(_ sender: UIButton) {
        updateTable(hashtag: "school")
    }
    
    @IBAction func searchForPersonalProjects(_ sender: UIButton) {
        updateTable(hashtag: "personal")
    }
    
    @IBAction func searchForDatabases(_ sender: Any) {
        updateTable(hashtag: "sql")
        model.appendProjects(thatHave: "nosql")
        tableView?.reloadData()
    }
    
    @IBAction func searchForFrontend(_ sender: UIButton) {
        updateTable(hashtag: "frontend")
    }
    
    @IBAction func searchForBackend(_ sender: Any) {
        updateTable(hashtag: "backend")
    }
    
    @IBAction func searchForMisc(_ sender: UIButton) {
        updateTable(hashtag: "")
    }
    
    
    // load as many table cells as there are corresponding projects
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.size()
    }
    
    // load tabel cell with appropiate data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)

        // Configure the cell...
//        cell.textLabel?.text = "Row \(indexPath.row)"
        guard let label = cell.textLabel else {
            return cell
        }
        
        if let project = model.project(at: indexPath.row) {
            label.text = project.name
            if let subtile = cell.detailTextLabel {
                subtile.text = project.language
            }
        }
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let search = searchbar.text {
            updateTable(hashtag: search)
        }
    }
    
    // updates table with appropriate projects
    func updateTable(hashtag: String) {
        model.showProjects(thatHave: hashtag)
        tableView?.reloadData()
    }
    
    /*
     prepares for segue by loading data to upcomming VC
     the new VC will display the information according to the data send
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProjectInfoViewController {
            let vc = segue.destination as! ProjectInfoViewController
            let cell: UITableViewCell = sender as! UITableViewCell
            vc.nameFromTable = cell.textLabel?.text ?? ""
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        tableVC.reloadData()
        super.viewDidAppear(animated)
        tableView?.reloadData()
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TabelCell")
        tableView.dataSource = self
        
        searchbar.showsScopeBar = true
        searchbar.delegate = self

    }

}
