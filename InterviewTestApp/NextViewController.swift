//
//  NextViewController.swift
//  InterviewTestApp
//
//  Created by Krzysztof Kita on 09/06/2022.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var enteredValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Result View"

        label.text = enteredValue != nil ? "\(enteredValue!)" : "N/A"
        }
}
