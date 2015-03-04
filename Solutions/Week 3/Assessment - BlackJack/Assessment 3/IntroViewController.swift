//
//  IntroViewController.swift
//  Assessment 3
//
//  Created by Rob Wyant on 1/24/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var moneyAmt: UITextField!
    @IBOutlet weak var walletText: UILabel!

    var money = ""
    var wallet = 0
    
    func createWallet() -> Int {
        money = moneyAmt.text
        return money.toInt()!
    }
    
    @IBOutlet weak var moneyPickerView: UIPickerView!
    
    var moneyOptions = ["$100","$250","$500","$750","$1000"]
    var moneyValues = [100,250,500,750,1000]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(moneyPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moneyOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return moneyOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        wallet = moneyValues[row]
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    @IBAction func nextScreenButton(sender: AnyObject) {
        println("\(wallet)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moneyPickerView.dataSource = self
        moneyPickerView.delegate = self
        walletText.text = moneyOptions[3]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
