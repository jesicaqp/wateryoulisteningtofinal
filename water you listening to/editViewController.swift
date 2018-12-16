//
//  editViewController.swift
//  water you listening to
//
//  Created by Jesica Quinones on 12/16/18.
//  Copyright © 2018 Jesica Quinones. All rights reserved.
//

import UIKit

    
class editViewController: UITableViewController, UISearchResultsUpdating{
        
        
        @IBOutlet weak var saveButton: UIButton!
        var filteredArray = [String]()
        var array = ["One Time - Justin Bieber", "Baby - Justin Bieber", " Happier - Marshmallow", "Lovebug - Jonas Brothers", "Complicated - Avril Lavigne", "Love Story - Taylor Swift", "22 - Taylor Swift"]
        var searchController = UISearchController()
        var resultsController = UITableViewController()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        @IBAction func backClicked(_ sender: Any) {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "input")
            self.present(nextViewController, animated:true, completion:nil)
        }
        
        @IBAction func saveClicked(_ sender: Any) {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "main")
            self.present(nextViewController, animated:true, completion:nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            searchController = UISearchController(searchResultsController: resultsController)
            tableView.tableHeaderView = searchController.searchBar
            searchController.searchResultsUpdater = self
            resultsController.tableView.delegate = self
            resultsController.tableView.dataSource = self
            //tableView?.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.identifier)
            tableView?.allowsMultipleSelection = true
            
            
            
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
            selectedCell.contentView.backgroundColor = UIColor(hue: 0, saturation: 0.23, brightness: 1, alpha: 1.0) /* #bff6ff */
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.backgroundColor =  UIColor(hue: 0, saturation: 0.23, brightness: 1, alpha: 1.0)
                cell.tintColor = UIColor(hue: 0, saturation: 0.23, brightness: 1, alpha: 1.0)
                cell.accessoryView?.tintColor = UIColor(hue: 0, saturation: 0.23, brightness: 1, alpha: 1.0)
                cell.accessoryView?.backgroundColor = UIColor(hue: 0, saturation: 0.23, brightness: 1, alpha: 1.0)
                cell.accessoryType = .checkmark
                
                
            }
        }
        
        override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
            cellToDeSelect.accessoryType = .none
            cellToDeSelect.contentView.backgroundColor = .white
            
        }
        
        
        
        func updateSearchResults(for searchController: UISearchController) {
            filteredArray = array.filter({ (array:String) -> Bool in if array.contains(searchController.searchBar.text!){
                return true
            } else {
                return false
                }
            })
            resultsController.tableView.reloadData()
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView == resultsController.tableView {
                return filteredArray.count
            } else {
                return array.count
            }
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            if tableView == resultsController.tableView {
                cell.textLabel?.text = filteredArray[indexPath.row]
            } else {
                cell.textLabel?.text = array[indexPath.row]
            }
            return cell
        }
        
        
    }


