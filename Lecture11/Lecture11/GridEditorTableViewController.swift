//
//  GridEditorTableViewController.swift
//  Lecture11
//
//  Created by Van Simmons on 11/20/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class GridEditorTableViewController: UITableViewController {

    var sectionHeaders = [
        "One", "Two", "Three", "Four", "Five", "Six"
    ]
    
    var data = [
        [
            "Apple",
            "Banana",
            "Cherry",
            "Date"
        ],
        [
            "Kiwi",
            "Apple",
            "Banana"
        ],
        [
            "Cherry"
        ],
        [
            "Date",
            "Kiwi",
            "Apple",
            "Banana",
            "Cherry",
            "Date"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var reuseId = "Grid"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.item]
        cell.detailTextLabel?.text = "this is some text"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editor = segue.destination as? GridEditorController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let fruitValue = data[indexPath.section][indexPath.row]
                editor.fruit = fruitValue
                editor.saveClosure = { newValue in
                    self.data[indexPath.section][indexPath.row] = newValue
                    self.tableView.reloadData()
                }
            }
        }
    }
}
