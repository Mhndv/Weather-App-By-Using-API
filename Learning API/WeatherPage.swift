//
//  WeatherPage.swift
//  Learning API
//
//  Created by Mohanned Alsahaf on 23/01/1444 AH.
//

import UIKit
import Alamofire

class WeatherPage: UIViewController {
    
    @IBOutlet weak var citynameLabel: UILabel!
    
    @IBOutlet weak var tempDegreeLabel: UILabel!
   
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var feelslikeLabel: UILabel!
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    var calctoCel : Double = 0.0
    
    var selectedcity:Int = 0
    var params = ["id":"108410","appid":"44f30cb3840ddffb8c4dbe379884957a"] as [String : String]
    
    /*
     jeddah 105343
     makkah 104514
     riyadh 108410
     al ahsa 109571
     dammam 110336
     portland 4650946
     abha 110690
     q8 285787
     london 4119617
     new york 5128581
     bahrain 290291
     Paris 2968815
     Turkey 298795
     Qatar 289688
     Antarctica  6255152
     */
    
    var cityid = ["Jeddah":"105343","Al Ahsa":"109571","Riyadh":"108410","Dammam":"110336","Makkah":"104514","Portland":"4650946","Abha":"110690","Kuwait":"285787","New York":"5128581","Bahrain":"290291","Paris":"2968815","London":"4119617","Turkey":"298795","Qatar":"289688","Antarctica":"6255152"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        NotificationCenter.default.addObserver(self, selector: #selector(citychange), name: NSNotification.Name(rawValue: "cityvalueChanged"), object: nil)
        

               getcityinfo(id: params["id"]!)
        

    }
    

    
    @objc func citychange(notification: Notification){
        if let city = notification.userInfo?["city"] as? City{
            citynameLabel.text = city.name
           var id =  cityid[city.name]
            getcityinfo(id:id!)
            
            
            /*
             here when the notification is sent for the chosen country it will go to this function and take the id from cityid dictionary and then go to getcityinfo function to apply the changes
             */
        }
    }
    
    
    
    
    
    
    func getcityinfo(id:String){
        /*
         take the id number for the country from the api and put it in dictionary and then take the chosed named country from the other page and check the name from the country and put it in params to change the link to the country id
         */
        params["id"] = id
        loaderActivityIndicator.isHidden = false
        loaderActivityIndicator.startAnimating()
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { res in
            
            
            if let result = res.value {
                let JSON = result as! NSDictionary
                let main = JSON["main"] as! NSDictionary
                let temp = main["temp"] as! Double// take tghe key for the temp
                self.calctoCel = temp - 273.15
                self.calctoCel = Double(round(1000*self.calctoCel)/1000)
                self.tempDegreeLabel.text = String("\(self.calctoCel)°")
                let feels = main["feels_like"] as! Double //take the key for feels like
                self.calctoCel = feels - 273.15
                self.calctoCel = Double(round(1000*self.calctoCel)/1000)
                self.feelslikeLabel.text = String("\(self.calctoCel)°")
                let hum = main["humidity"] as! Int
                self.humidityLabel.text = String(hum)
                
                self.loaderActivityIndicator.stopAnimating()
                self.loaderActivityIndicator.isHidden = true
                
                        }
            
            
           
        }
    }
    
    

}
