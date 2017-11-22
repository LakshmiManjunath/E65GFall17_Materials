//
//  FirstViewController.swift
//  Lecture11
//
//  Created by Van Simmons on 11/20/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class InstrumentationController: UIViewController {

    var tableViewController: GridEditorTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addFruit(_ sender: Any) {
        tableViewController.data[0].append("New Item")
        tableViewController.tableView.reloadData()
    }
    
    @IBAction func deleteFruit(_ sender: Any) {
        tableViewController.data[0].remove(at: 0)
        if tableViewController.data[0].count == 0 {
            tableViewController.data.remove(at: 0)
        }
        if let indexPath = tableViewController.tableView?.indexPathForSelectedRow {
//            tableViewController.data[indexPath.section].remove(at: indexPath.item)
        }
        tableViewController.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GridEditorTableViewController {
            tableViewController = vc
        }
    }
}

