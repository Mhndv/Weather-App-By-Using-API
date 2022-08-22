//
//  ChoosingCityPage.swift
//  Learning API
//
//  Created by Mohanned Alsahaf on 23/01/1444 AH.
//

import UIKit

class ChoosingCityPage: UIViewController {
    var citiesArray = [City(name: "Riyadh"),
                       City(name: "Al Ahsa"),
                       City(name: "Jeddah"),
                       City(name: "Makkah"),
                       City(name: "Dammam"),
                       City(name: "Portland"),
                       City(name: "Kuwait"),
                       City(name: "Abha"),
                       City(name: "London"),
                       City(name: "New York"),
                       City(name: "Bahrain"),
                       City(name: "Paris"),
                       City(name: "Turkey"),
                       City(name: "Qatar"),
                       City(name: "Antarctica")
    ]
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    var selectedCity:City?
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func EditCityButtonClicked(_ sender: Any) {
        
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityvalueChanged"), object: nil,userInfo: ["city" : city])
            self.dismiss(animated: true)
        }
        
    }
    

}

extension ChoosingCityPage : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
        
    }//ارجع المعلومات اللي داخل
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         selectedCity = citiesArray[row]
    }
    
}
