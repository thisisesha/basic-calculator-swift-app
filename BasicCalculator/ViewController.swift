//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Esha Chiplunkar on 9/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var textFieldFirstNum: UITextField!
    
    @IBOutlet weak var textFieldSecondNum: UITextField!
    
    @IBOutlet weak var operationsLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the keyboard type to decimalPad for both text fields
        textFieldFirstNum.keyboardType = .decimalPad
        textFieldSecondNum.keyboardType = .decimalPad
                
        addButton.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(onButtonSubtractTapped), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(onButtonMultiplyTapped), for: .touchUpInside)
        divideButton.addTarget(self, action: #selector(onButtonDivTapped), for: .touchUpInside)
    }
    
    @objc func onButtonAddTapped() {
            
        // Unwrapping both text field values using if-let
        if let firstText = textFieldFirstNum.text, let firstNum = Double(firstText), let secondText = textFieldSecondNum.text, let secondNum = Double(secondText) {
                    
            let result = firstNum + secondNum
                resultLabel.text = String(format: "%.2f", result)
                    
        } else {
            showAlertForEmptyTextFields()
        }

    }
        
    @objc func onButtonSubtractTapped() {
            
        if let firstText = textFieldFirstNum.text, let firstNum = Double(firstText),
            let secondText = textFieldSecondNum.text, let secondNum = Double(secondText) {
                
            let result = firstNum - secondNum
            resultLabel.text = String(format: "%.2f", result)
                
        } else {
            showAlertForEmptyTextFields()
        }

    }
        
    @objc func onButtonMultiplyTapped() {
            
        if let firstText = textFieldFirstNum.text, let firstNum = Double(firstText),
           let secondText = textFieldSecondNum.text, let secondNum = Double(secondText) {
                
            let result = firstNum * secondNum
            resultLabel.text = String(format: "%.2f", result)
                
        } else {
            showAlertForEmptyTextFields()
        }

    }
        
    @objc func onButtonDivTapped() {
            
        if let firstText = textFieldFirstNum.text, let firstNum = Double(firstText),
            let secondText = textFieldSecondNum.text, let secondNum = Double(secondText) {
                
            if secondNum != 0 {
                let result = firstNum / secondNum
                resultLabel.text = String(format:"%.2f", result)
            } else {
                showAlertForDivByZero()
            }
                
        } else {
                showAlertForEmptyTextFields()
        }

    }
        
    func showAlertForEmptyTextFields() {
        let alert = UIAlertController(title: "Error!", message: "The numbers cannot be empty!", preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
        present(alert, animated: true)
    }
    
    func showAlertForDivByZero() {
        let alert = UIAlertController(title: "Error!", message: "Cannot divide by zero!", preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
        present(alert, animated: true)
    }

}

