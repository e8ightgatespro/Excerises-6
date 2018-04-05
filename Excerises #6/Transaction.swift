//
//  Transaction.swift
//  Excerises #6
//
//  Created by Voss, Garrett on 4/5/18.
//  Copyright © 2018 Voss, Garrett. All rights reserved.
//

import UIKit

class Transaction: NSObject {
    var date:Date {
        get{
            return Date.init()
        }
    }
    var accountNumber:String
    var amount:Double {
        didSet{
            if amount <= 0 {
                oldValue == amount
                amount = 1
                //print("The amount must be greater than 0. You entered: \(oldValue)")
            }
        }
    }
    var type:String {
        didSet{
            if type != "deposit" {
                if type != "withdraw" {
                    oldValue == type
                    type = ""
                    //print("please enter either withdraw or deposit for the transaction type. You entered: \(oldValue)")
                }
            }
        }
    }
    var isProcessed:Bool
    
    init(AccountNumber: String?, Amount: Double?, Type: String?){
        accountNumber = AccountNumber!
        amount = Amount!
        type = Type!
        isProcessed = false
    }
    
    
    
    func ProcessTransaction() {
        if type == "deposit" {
            if amount > 100 {
                isProcessed = true
            }
            else {
                //print("Deposit not processed")
            }
            
        }
        else if type == "withdraw" {
            if amount > 500 {
                isProcessed = true
                //print("Withdrawal processed")
            }
            else{
                //print("Withdrawal not processed")
            }
        }
        
    }
}
