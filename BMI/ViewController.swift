//
//  ViewController.swift
//  BMI
//
//  Created by Mañanas on 8/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weight = 60
    var height = 170
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func weightChanger(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
    }
    @IBAction func heightChanger(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text="\(height) cm"
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        // Calculate BMI
        let result = Float (weight) / pow((Float(height) / 100), 2)
        resultLabel.text = String(format: "%.2f", result)
        
        var color = UIColor.black
        var description = ""
        var showAlert = false
        switch (result) {
        case 0.0..<18.5:
            color = UIColor(named: "bmi_underweight")!
            description = "Underweight"
        case 18.5..<25:
            color = UIColor(named: "bmi_normal")!
            description = "Normal"
        case 25..<30:
            color = UIColor(named: "bmi_overweight")!
            description = "Overweight"
        case 30..<35:
            color = UIColor(named: "bmi_obese")!
            description = "Obese"
        case 35..<40:
            color = UIColor(named: "bmi_morbidly_obese")!
            description = "Morbidly Obese"
            showAlert = true
        default:
            color = UIColor(named: "bmi_extreme_obesity")!
            description = "Extreme Obesity"
            showAlert = true
            
        }
        
        descriptionLabel.text = description
        
        resultLabel.textColor = color
        descriptionLabel.textColor = color
        
        if (showAlert) {
            let alert = UIAlertController(
                title: "Health Risk",
                message: "Obesity is a serious health concern that increases the risk of many other health conditions. Seek help as soon as possible.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "More information", style: .default, handler: { action in
                let adviceSite = "https://www.nhs.uk/conditions/obesity/"
                if let url = URL(string: adviceSite), UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.open(url)
                    
                }
            }))
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    
   
}

