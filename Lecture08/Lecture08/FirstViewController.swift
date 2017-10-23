//
//  FirstViewController.swift
//  Lecture08
//
//  Created by Van Simmons on 10/19/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, GridViewDataSource {

    var engine: Engine = Engine.engine
    @IBOutlet weak var gridView: XView!
    
    subscript(row: Int, col: Int) -> CellState {
        get {
            return engine.grid[(row, col)]
        }
        set {
            engine.grid[(row,col)] = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gridView.gridDataSource = self
        engine.updateClosure = { grid in
            self.gridView.setNeedsDisplay()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func step(_ sender: Any) {
        _ = engine.step()
        gridView.setNeedsDisplay()
    }
    
    @IBAction func start(_ sender: Any) {
        engine.timerInterval = 0.5
    }
    
    @IBAction func stop(_ sender: Any) {
        engine.timerInterval = 0.0
    }
}

