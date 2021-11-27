//
//  BudgetViewController.swift
//  Tip Calculator
//
//  Created by Juan Gallo on 25/11/21.
//  Copyright © 2021 Josiel Aponte. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    
    @IBOutlet weak var budget: UITextField!
    
    @IBOutlet weak var expenses: UILabel!
    
    @IBOutlet weak var amountLeft: UILabel!
    
    var total = 0
    var calculation = 0
    var other = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        budget.becomeFirstResponder()
        expenses.text = String(total)
        
    }
    
    func result () {
        calculation = (budget.text! as NSString).integerValue
        
    
        print(calculation)
            other = calculation - total
        print ("Result\(other)")
        amountLeft.text = String(other)
            
        
        
//        amountLeft.text = String(format: "$%0.2f%", (other))
    }

    @IBAction func budgetCalculation(_ sender: UITextField, forEvent event: UIEvent) {
        result()
    }
    
    
    
    
    }

    


