//
//  SecondViewController.swift
//  Lecture10
//
//  Created by Van Simmons on 11/13/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var step: UIStepper!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var fusciaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func step(_ sender: UIStepper) {
        let step = sender.value
        var bounds = grayView.bounds
        bounds.origin.y = CGFloat(step * 10.0)
        grayView.bounds = bounds
    }
    
}

