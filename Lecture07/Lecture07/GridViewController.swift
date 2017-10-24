//
//  FirstViewController.swift
//  Lecture07
//
//  Created by Van Simmons on 10/23/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet weak var gridView: XView!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func step(_ sender: UIButton) {
        gridView.grid = gridView.grid.next()
        gridView.setNeedsDisplay()
    }

    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            self.gridView.grid = self.gridView.grid.next()
            self.gridView.setNeedsDisplay()
        }
    }
    @IBAction func stop(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
    }
    
}

