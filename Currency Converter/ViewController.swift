//
//  ViewController.swift
//  Currency Converter
//
//  Created by Student on 4/25/16.
//  Copyright © 2016 shp. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {
    
//UITextfield and UILabel
    @IBOutlet weak var label: UILabel!
   
    @IBOutlet weak var usdamount: UITextField!

//Creating variables
    var currencynum = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//Dispose of any resources that can be recreated.
        
    }
//Giving values to different cases of segmented control
    @IBAction func currency(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            currencynum = 0
            break
        case 1:
            currencynum = 1
            break
        case 2:
            currencynum = 2
            break
        case 3:
            currencynum = 3
            break
        default:
            break
            }
    }
//Conversions and updating label
    @IBAction func convert(sender: AnyObject) {
        let num = Int(usdamount.text!)
        switch currencynum {
        case 0:
            if num == nil {
                label.text = "Input a Value"
            } else {
            let convertednum = Double(num!) * 6.49
            label.text = "\(num!) USD is \(convertednum) Yuan!"
            }
            break
        case 1:
            if num == nil {
                label.text = "Input a Value"
            } else {
            let convertednum = Double(num!) * 0.89
            label.text = "\(num!) USD is \(convertednum) Euros!"
            }
            break
        case 2:
            if num == nil {
                label.text = "Input a Value"
            } else {
            let convertednum = Double(num!) * 0.69
            label.text = "\(num!) USD is \(convertednum) English Pounds!"
            }
            break
        case 3:
            if num == nil {
                label.text = "Input a Value"
            } else {
            let convertednum = Double(num!) * 111.28
            label.text = "\(num!) USD is \(convertednum) Yen!"
            }
            break
        default:
            break
        }
    }
    @IBAction func shareToTwitter(sender: AnyObject) {
        let shareToTwitter: SLComposeViewController = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        self.presentViewController(shareToTwitter, animated: true, completion: nil)
        if label.text == "Input a Value" {
            shareToTwitter.setInitialText("Hello, I'm posting from an app I made!")
        } else {
            shareToTwitter.setInitialText(label.text)
        }
        
    }
}