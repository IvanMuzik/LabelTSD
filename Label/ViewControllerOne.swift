//
//  ViewController.swift
//  Label
//
//  Created by Ivan Muzalevski on 2.11.22.
//

import UIKit

class ViewControllerOne: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerColorTextOutlet: UIPickerView!
    @IBOutlet weak var pickerLinesTextOutlet: UIPickerView!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    
    // создать тени для текста
    // создать перенос текста
    
    var colorText = [("white", UIColor.white),
                    ("blue", UIColor.blue),
                    ("yellow", UIColor.yellow),
                    ("green", UIColor.green),
                    ("red", UIColor.red),
                    ("black", UIColor.black)]
    
    var numOfLines = [0, 1, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pickerColorTextOutlet.dataSource = self
        pickerColorTextOutlet.delegate = self
        pickerLinesTextOutlet.delegate = self
        pickerLinesTextOutlet.dataSource = self
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sender.minimumValue = 8
        sender.maximumValue = 60
        sender.addTarget(self, action: #selector(sliderTarget), for: .valueChanged)
        
    }
    
    @objc func sliderTarget(){
        let slid = sliderOutlet.value
        label.font = label.font.withSize(CGFloat(slid))
    }
    
    @IBAction func addTextLabel(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {action in
            let text = alert.textFields?.first?.text
            self.label.text = text
        } )
        alert.addAction(action)
        alert.addTextField ()
        present(alert, animated: true)

    }
    
    @IBAction func swichShadowText(_ sender: UISwitch) {
    }
    
    @IBAction func swichLineBreak(_ sender: UISwitch) {
        if sender.isOn{
            self.label.lineBreakMode = .byWordWrapping
            self.label.numberOfLines = 0
            self.label.adjustsFontSizeToFitWidth = true
            self.label.sizeToFit()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerLinesTextOutlet {
            return numOfLines.count
        } else {
            return colorText.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerLinesTextOutlet{
            return String(numOfLines[row])
        }else {
            return colorText[row].0
        }
        // добавить дидсет пикер
        // разобраться что он делает
        
    }
}
