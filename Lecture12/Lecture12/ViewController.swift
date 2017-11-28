//
//  ViewController.swift
//  Lecture12
//
//  Created by Van Simmons on 11/27/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

let configs = URL(string: "https://www.dropbox.com/s/p6iad4piknaja3p/S65g.json?dl=1")

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetch(_ sender: Any) {
        let fetcher = Fetcher()
        fetcher.fetch(url: configs!) { (result) in
            var resultString = ""
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let config = try! decoder.decode([GridConfiguration].self, from: data)
                resultString = config.description
            case .failure(let message):
                resultString = message
            }
            OperationQueue.main.addOperation {
                self.textView.text = resultString
            }
        }
    }
    
}

