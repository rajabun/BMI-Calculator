//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Muhammad Rajab Priharsanto on 24/04/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBMIValue()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var bmiTitle: UILabel!
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var bmiStatus: UILabel!
    
    func setBMIValue() {
        let weight = weightSlider.value
        let height = heightSlider.value
        let hitungBmiValue = weight/(height*height)
        let hitungBmiValueResult = String(format: "%.1f", hitungBmiValue)
        
        bmiValue.text = "\(hitungBmiValueResult) kg/m2"
        setBMIStatus(with: hitungBmiValue)
    }
    
    func setBMIStatus(with value: Float) {
        switch value {
        case ...15:
            bmiStatus.text = "Underweight"
            bmiStatus.textColor = .red
        case 15...25:
            bmiStatus.text = "Normal"
            bmiStatus.textColor = .green
        case 25...30:
            bmiStatus.text = "Obese"
            bmiStatus.textColor = .orange
        case 30...:
            bmiStatus.text = "Overweight"
            bmiStatus.textColor = .red
        default:
            print("Value Error")
        }
    }
    
    
    @IBAction func sliderWeight(_ sender: UISlider) {
        
        let weightValueChanged = weightSlider.value
        let weightValueChangedResult = String(format: "%.1f", weightValueChanged)
        
        weightValue.text = "\(weightValueChangedResult) kg"
        setBMIValue()
    }
    
    @IBAction func sliderHeight(_ sender: UISlider) {
        
        let heightValueChanged = heightSlider.value
        let heightValueChangedResult = String(format: "%.2f", heightValueChanged)
        
        heightValue.text = "\(heightValueChangedResult) m"
        setBMIValue()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //For View Mode
    @IBAction func viewMode(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            view.backgroundColor = .white
            appTitle.textColor = .black
            weightTitle.textColor = .black
            weightValue.textColor = .black
            heightTitle.textColor = .black
            heightValue.textColor = .black
            bmiTitle.textColor = .black
            bmiValue.textColor = .black
            //bmiStatus.textColor = .black
        case 1:
            view.backgroundColor = .black
            appTitle.textColor = .white
            weightTitle.textColor = .white
            weightValue.textColor = .white
            heightTitle.textColor = .white
            heightValue.textColor = .white
            bmiTitle.textColor = .white
            bmiValue.textColor = .white
            //bmiStatus.textColor = .white
        default:
            break
        }
 
    }
    
    
}

/* Hubungin dulu slider dari storyboard ke code
 
 //For Weight Slider
 @IBAction func sliderWeight(_ sender: UISlider) {
 weightValue.text = "\(String(format: "%.1f", sender.value)) kg"
 
 }
 
 //For Height Slider
 @IBAction func sliderHeight(_ sender: UISlider) {
 heightValue.text = "\(String(format: "%.1f", sender.value)) m"
 }
 */
