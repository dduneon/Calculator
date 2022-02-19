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
    case nuknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        
    }
    @IBAction func tapClearButton(_ sender: UIButton) {
        
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        
    }
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        
    }
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        
    }
    @IBAction func tapAddButton(_ sender: UIButton) {
        
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        
    }
}

