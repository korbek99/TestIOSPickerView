//
//  ViewController.swift
//  TestIOSPickerView
//
//  Created by Jose David Bustos H on 05-04-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myPicker: UIPickerView!

    let pickerData = [
        ["10\"","14\"","18\"","24\""],
        ["Cheese","Pepperoni","Sausage","Veggie","BBQ Chicken"]
    ]
    
    let sizeComponent = 0
    let toppingComponent = 1
    
    
    
    //MARK: - Picker View Data Sources and Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int)
    {
        updateLabel()
    }
    
    //MARK: - Instance Methods
    func updateLabel(){
        let size = pickerData[sizeComponent][myPicker.selectedRow(inComponent: sizeComponent)]
        let topping = pickerData[toppingComponent][myPicker.selectedRow(inComponent: toppingComponent)]
        myLabel.text = "Pizza: " + size + " " + topping
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.selectRow(2, inComponent:sizeComponent, animated: false)
        updateLabel()
    }
}

