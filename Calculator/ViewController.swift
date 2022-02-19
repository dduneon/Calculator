//
//  ViewController.swift
//  Calculator
//
//  Created by 준현의 Macbook Pro on 2022/02/17.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case Equal
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    @IBOutlet weak var operationOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else { return }
        
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
        
    }
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.clear()
        self.displayNumber = ""
        self.result = ""
        self.numberOutputLabel.text = "0"
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
        self.operationOutputLabel.text = sender.titleLabel?.text
    }
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
        self.operationOutputLabel.text = sender.titleLabel?.text
    }
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
        self.operationOutputLabel.text = sender.titleLabel?.text
    }
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
        self.operationOutputLabel.text = sender.titleLabel?.text
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(.Equal)
        self.operationOutputLabel.text = sender.titleLabel?.text
    }
    
    func operation(_ operation: Operation) {
        if operation == .Equal {
            if self.currentOperation != .unknown, !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = String(firstOperand / secondOperand)
                case .Multiply:
                    self.result = String(firstOperand * secondOperand)
                default:
                    break
                }
                
                self.clear()
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.displayNumber = "\(Int(result))"
                }
                else { self.displayNumber = self.result }
                
                self.numberOutputLabel.text = self.displayNumber
                self.firstOperand = self.displayNumber
            }
        } else {
            if self.currentOperation != .unknown {
                self.currentOperation = operation
            }
            else {
                self.firstOperand = self.displayNumber
                self.currentOperation = operation
                self.displayNumber = ""
            }
        }
    }
    
    func clear() {
        self.firstOperand = ""
        self.secondOperand = ""
        self.currentOperation = .unknown
    }
}

