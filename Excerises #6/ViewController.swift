//
//  ViewController.swift
//  Excerises #6
//
//  Created by Voss, Garrett on 4/5/18.
//  Copyright © 2018 Voss, Garrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtAccountNumber: UITextField!
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtIsProccessed: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        txtDate.text = dateFormatter.string(from: Date.init())
        txtIsProccessed.text = "False"
        lblMessage.text = ""
        txtDate.sizeToFit()
        txtIsProccessed.sizeToFit()
    }
    
    func SaveTransaction(){
        //"SAVE" the transaction. We don't have to persist the data
        let newTransaction = Transaction(AccountNumber:"" , Amount:0 , Type:"")
        newTransaction.accountNumber = txtAccountNumber.text!
        newTransaction.type = txtType.text!
        newTransaction.amount = Double(txtAmount.text!)!
        lblMessage.text = "Transaction Saved!"
        if newTransaction.type == "deposit" {
            if newTransaction.amount > 100 {
                newTransaction.isProcessed = true
                txtIsProccessed.text = "True"
            }
            else {
                txtIsProccessed.text = "False"
            }
        }
        if newTransaction.type == "withdraw" {
            if newTransaction.amount > 500 {
                newTransaction.isProcessed = true
                txtIsProccessed.text = "True"
            }
            else {
                txtIsProccessed.text = "False"
            }
        }
    }
    
    func CancelTransaction(){
        //Clear all of the controls in the view
        txtAccountNumber.text = ""
        txtAmount.text = ""
        txtType.text = ""
        txtIsProccessed.text = "False"
        lblMessage.text = "Transaction Cancelled!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSaveTouched(_ sender: Any) {
        SaveTransaction()
    }
    @IBAction func btnCancelTouched(_ sender: Any) {
        CancelTransaction()
    }
    
}

