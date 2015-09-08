//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mukesh Jain on 9/7/15.
//  Copyright (c) 2015 walmart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipAmount.text = "$0.00"
        totalAmount.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18,0.2,0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billText = billField.text
        
        var billAmount : Double = Double((billText as NSString).doubleValue)
        
        var tip = billAmount * tipPercentage;
        var total = billAmount + tip
        
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("tip_default")
        
        var tipPercentages = [0.18,0.2,0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billText = billField.text
        
        var billAmount : Double = Double((billText as NSString).doubleValue)
        
        var tip = billAmount * tipPercentage;
        var total = billAmount + tip
        
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        
        
        
        println("main view will appear  \(tipControl.selectedSegmentIndex)")
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("main view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("main view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("main view did disappear")
    }
    

}

