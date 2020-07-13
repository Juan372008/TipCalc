//
//  TipCalculator.swift
//  Tip Calculator
//
//  Created by Josiel Aponte, Nathan Thimothe on 7/4/19.
//  Copyright © 2019 Josiel Aponte, Nathan Thimothe. All rights reserved.
//

import Foundation

class TipCalculator {
    //make all the inital amounts 0
    var initialAmount: Double = 0
    var tipAmount: Double = 0
    var tipPercent: Double = 0
    var totalAmount: Double = 0
    
    //initializer of the Tip Calculator class
    init(initialAmount: Double, tipPercent: Double) {
        self.initialAmount = initialAmount
        self.tipPercent = tipPercent
    }
    
    func calculateTip() {
        //billTotal * tipPerc
        tipAmount = initialAmount * tipPercent
        //tip Amt + initial Amount
        totalAmount = tipAmount + initialAmount
    }
    
}
