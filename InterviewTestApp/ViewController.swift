//
//  ViewController.swift
//  InterviewTestApp
//
//  Created by Krzysztof Kita on 09/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var showNextScreenButton: UIButton!
    
    private var enteredValue: Double? = nil
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Data Entry View"

        textField.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        infoLabel.isHidden = true
        enteredValue = nil
        textField.text = nil
        showNextScreenButton.isEnabled = false
        
        textField.accessibilityIdentifier = "Text_Field"
    }

    @IBAction func didTapOkButton(_ sender: Any) {
        guard let text = textField.text else {
            showError("Did not enter any text!")
            return
        }
        guard let decimalValue = Double(text) else {
            showError("Text cannot be converted to decimal number")
            return
        }
        
        enteredValue = decimalValue
        showInfo("Entered value: \(decimalValue)")
        showNextScreenButton.isEnabled = true
        
    }
    
    private func showError(_ errMsg: String) {
        showInfoMsg(errMsg, textColor: .red)
    }
    
    private func showInfo(_ msg: String) {
        showInfoMsg(msg, textColor: .blue)
    }
    
    private func showInfoMsg(_ msg: String, textColor: UIColor) {
        DispatchQueue.main.async {
            self.infoLabel.textColor = textColor
            self.infoLabel.text = msg
            self.infoLabel.isHidden = false
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        (segue.destination as? NextViewController)?.enteredValue = enteredValue
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
