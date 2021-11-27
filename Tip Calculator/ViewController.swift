//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Josiel Aponte, Nathan Thimothe on 7/2/19.
//  Copyright © 2019 Josiel Aponte, Nathan Thimothe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialTotal: UITextField!
    
    // UI Slider and Labels that are connected

    @IBOutlet weak var tipSlide: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var splitSlide: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var calculatedTotal: UILabel!
    @IBOutlet weak var calculatedTip: UILabel!
    
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var splitTip: UILabel!
    
    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTotal.becomeFirstResponder()
    }
    //creating a variable of type TipCalculator that has two fields, initial amount and tip Perc. it can calculate tips
    var tipCalculator = TipCalculator(initialAmount: 0, tipPercent: 0)
    
    func calculateBill() {
        tipCalculator.tipPercent = truncate(Double(tipSlide.value))
        print("percentage: ", tipCalculator.tipPercent)
        tipCalculator.initialAmount = (initialTotal.text! as NSString).doubleValue
        print("initial Amount: ", tipCalculator.initialAmount)
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func truncate(_ val : Double) -> Double {
        return (floor(100 * val) / 100)
    }

    func updateUI() {
        // all of these texts are formatted as floats
        
        calculatedTotal.text = String(format: "$%0.2f%", tipCalculator.totalAmount)
        //number of people is calculated to be whatever the value the slider is currently at
        let numPeople: Int = Int(splitSlide.value)
        //the splitTotal is the tip divided by the number of people, calculated by tip calculaotr
        splitTotal.text = String(format: "$%0.2f%", (tipCalculator.totalAmount) / Double(numPeople))
        //the calculated tip is the tipPercent * initial total, calculated by the tip calculator
        calculatedTip.text = String(format: "$%0.2f%", tipCalculator.tipAmount)
        //splitTip is the tipAmount divided by the number of people, calculated by tip Calculator
        splitTip.text = String(format: "$%0.2f%", (tipCalculator.tipAmount) / Double(numPeople))
        
    }
  
    func transitionToBudget() {

        
        performSegue(withIdentifier: "ShowDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let Tc = TipCalculator(initialAmount: (initialTotal.text! as NSString).doubleValue, tipPercent: truncate(Double(tipSlide.value)))
        let total = Tc.totalAmount

        let bvc = segue.destination as! BudgetViewController
        bvc.total = Int(tipCalculator.totalAmount)
        print("Total\(total)")
    }
    // bring up keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initialTotal.resignFirstResponder()
    }
    
    // keyboard removed if touched out of bounds
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        initialTotal.resignFirstResponder()
        return false
    }
    
    @IBAction func initialAmountChanged(_ sender: Any) {
        calculateBill()
    }
    
    // Tip Label coressponding to slider
    @IBAction func tipSlideVChange(_ sender: Any) {
        let currentV = Int(tipSlide.value*100)
        tipLabel.text = "\(currentV)%"
        calculateBill()
    }


    // Split Label coressponding to slider
    @IBAction func splitSliderVChange(_ sender: Any){
        let currentV = Int(splitSlide.value)
        splitLabel.text = "\(currentV)"
        calculateBill()
    }
    
     
    
    
}

