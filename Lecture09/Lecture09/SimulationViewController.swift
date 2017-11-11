//
//  SecondViewController.swift
//  Lecture09
//
//  Created by Van Simmons on 11/6/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, GridViewDataSource, EngineDelegate, UITextFieldDelegate {

    var engine: Engine = Engine.engine
    @IBOutlet weak var gridView: XView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gridView?.gridDataSource = self
        engine.updateClosure = { _ in
            self.gridView?.setNeedsDisplay()
        }
        let center = NotificationCenter.default
        let name = Notification.Name(rawValue: "EngineUpdate")
        center.addObserver(
            self,
            selector: #selector(engineUpdate(notification:)),
            name: name,
            object: nil
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func engineDidUpdate(withGrid: Grid) {
        gridView.setNeedsDisplay()
    }

    @objc func engineUpdate(notification: Notification) {
        gridView.setNeedsDisplay()
    }
    
    var size: Int {
        return engine.size
    }
    subscript(row: Int, col: Int) -> CellState {
        get {
            return engine.grid[(row, col)]
        }
        set {
            engine.grid[(row,col)] = newValue
        }
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
    @IBAction func stepperChanged(_ sender: UIStepper) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == lastName {
            print("ended last with \(textField.text)")
        } else if textField == firstName {
            print("ended first with \(textField.text)")
        }
    }
    
}

