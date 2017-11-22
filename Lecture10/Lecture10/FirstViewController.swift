//
//  FirstViewController.swift
//  Lecture10
//
//  Created by Van Simmons on 11/13/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 310, height: 1000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

