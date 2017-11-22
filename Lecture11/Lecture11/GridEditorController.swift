//
//  GridEditorController.swift
//  Lecture11
//
//  Created by Van Simmons on 11/20/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class GridEditorController: UIViewController {

    var fruit: String?
    var saveClosure: ((String) -> Void)?
    @IBOutlet weak var fruitTextfield: UITextField!
    @IBOutlet weak var gridView: GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTextfield.text = fruit
        navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        fruit = fruitTextfield.text
        if let fruit = fruit {
            saveClosure?(fruit)
            navigationController?.popViewController(animated: true)
        }
    }
}
