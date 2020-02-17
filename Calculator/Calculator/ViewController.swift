//
//  ViewController.swift
//  Calculator
//
//  Created by DhakaLive on 1/5/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var txtFrstNumber: UITextField!
    @IBOutlet weak var txtSecondNumber: UITextField!
    
    @IBOutlet weak var txtResult: UILabel!
    
    private func add(firstNumber: Int, secondNumber : Int) -> Int {
        return firstNumber + secondNumber
    }
    
    private func sub(firstNumber : Int, secondNumber : Int) -> Int{
        return firstNumber - secondNumber
    }
    
    private func mul(firstNumber: Int, secondNumber : Int) -> Int {
        return firstNumber * secondNumber
    }
    private func div(firstNumber : Int, secondNumber : Int) -> Double {
        return Double(firstNumber) / Double(secondNumber)
    }
    
    private func convertToInt(num : String) -> Int{
        if let result = Int(num){
            return result
        }
        else{
            return 0
        }
    }
    
    private func textClear(){
        txtFrstNumber.text = ""
        txtSecondNumber.text = ""
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        guard let num1 = txtFrstNumber.text else{
            return
        }
        
        guard let num2 = txtSecondNumber.text else{
            return
        }
        
        let reult = add(firstNumber: convertToInt(num: num1), secondNumber: convertToInt(num: num2))
        txtResult.text = "Result : \(reult)"
        textClear()
    }
    
    
    @IBAction func btnSub(_ sender: Any) {
        guard let num1 = txtFrstNumber.text else{
            return
        }
        guard let num2 = txtSecondNumber.text else{
            return
        }
        
        let result = sub(firstNumber: convertToInt(num: num1), secondNumber: convertToInt(num: num2))
        txtResult.text = "Result : \(result)"
        
        textClear()
    }
    
    
    @IBAction func btnMul(_ sender: Any) {
        guard let num1 = txtFrstNumber.text else {
            return
        }
        
        guard let num2 = txtSecondNumber.text else {
            return
        }
        
        let  result = mul(firstNumber: convertToInt(num: num1), secondNumber: convertToInt(num: num2))
        
        txtResult.text = "Result : \(result)"
        
        textClear()
    }
    
    
    @IBAction func btnDiv(_ sender: Any) {
        
        guard let num1 = txtFrstNumber.text else {
            return
        }
        
        guard let num2 = txtSecondNumber.text else {
            return
        }
        
        let  result = div(firstNumber: convertToInt(num: num1), secondNumber: convertToInt(num: num2))
        
        txtResult.text = "Result : \(result)"
        
        textClear()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtFrstNumber.delegate = self
        txtFrstNumber.keyboardType = .numberPad
        
        txtSecondNumber.delegate = self
        txtSecondNumber.keyboardType = .numberPad
        
        let  tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        txtSecondNumber.endEditing(true)
    }

}


