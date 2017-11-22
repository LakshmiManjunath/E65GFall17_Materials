//
//  FruitViewController.swift
//  Lecture10
//
//  Created by Van Simmons on 11/13/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FruitViewController: UIViewController {

    var fruit: String?
    
    @IBOutlet weak var fruitTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTextfield.text = fruit

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
